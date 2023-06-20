from collections import defaultdict
from dataclasses import dataclass
import inspect
from operator import xor
import traceback
from typing import DefaultDict, Dict, List, Optional, Set
from dbt.contracts.graph.nodes import Metric as DbtMetric
from dbt.contracts.graph.nodes import ModelNode as DbtModelNode
from dbt.contracts.graph.unparsed import MetricFilter as DbtMetricFilter
from dbt.exceptions import ref_invalid_args
from dbt.contracts.graph.manifest import Manifest as DbtManifest
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from dbt_semantic_interfaces.implementations.filters.where_filter import PydanticWhereFilter
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.implementations.elements.dimension import PydanticDimension, PydanticDimensionTypeParams
from dbt_semantic_interfaces.implementations.elements.entity import PydanticEntity
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure
from dbt_semantic_interfaces.implementations.metric import PydanticMetric, PydanticMetricInputMeasure, MetricType, PydanticMetricTypeParams
from dbt_semantic_interfaces.implementations.semantic_manifest import PydanticSemanticManifest
from dbt_semantic_interfaces.implementations.semantic_model import NodeRelation
from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.validations.validator_helpers import SemanticManifestValidationResults, ValidationError, ValidationIssue
from dbt_semantic_interfaces.type_enums.time_granularity import TimeGranularity


@dataclass
class TransformedDbtMetric:  # noqa: D
    data_source: PydanticSemanticModel
    metric: PydanticMetric


CALC_METHOD_TO_MEASURE_TYPE: Dict[str, AggregationType] = {
    "count": AggregationType.COUNT,
    "count_distinct": AggregationType.COUNT_DISTINCT,
    "sum": AggregationType.SUM,
    "average": AggregationType.AVERAGE,
    "min": AggregationType.MIN,
    "max": AggregationType.MAX,
    # "derived": AggregationType.DERIVED # Derived DBT metrics don't create measures
}


class DbtManifestTransformer:
    """The DbtManifestTransform is a class used to transform dbt Manifests into MetricFlow UserConfiguredModels

    This helps keep track of state objects while transforming the Manifest into a
    UserConfiguredModel, ensuring like dbt Node elements are rendered only once and
    allowing us to pass around fewer arguments (reducing the mental load)
    """

    def __init__(self, manifest: DbtManifest) -> None:
        """Constructor.

        Args:
            manifest: A dbt Manifest object
        """
        self.manifest = manifest
        self._time_dimension_stats: Optional[Dict[str, List[str]]] = None  # lazy load it
        self._resolved_dbt_model_refs: Dict[int, DbtModelNode] = {}  # cache of resolved nodes

    @property
    def time_dimension_stats(self) -> Dict[str, List[str]]:
        """The stats on time dimensions from the dbt Manifest

        The time dimension stats are returned as a dictionary where in the keys
        are the names of the time dimension, and the value associated with each
        key is a list of `DbtMetric.model`s which that the associated time
        dimension should be primary for
        """
        if not self._time_dimension_stats:
            self._time_dimension_stats = self.collect_time_dimension_stats(
                dbt_metrics=list(self.manifest.metrics.values())
            )

        return self._time_dimension_stats

    def resolve_metric_model(self, dbt_metric: DbtMetric) -> DbtModelNode:
        """Returns a DbtModelNode based on the `DbtMetric.model`

        `DbtMetric.model` string values should either be a model name, or a
        dbt [ref] (https://docs.getdbt.com/reference/dbt-jinja-functions/ref)
        object for a model. A dbt `ref` contains either one or two
        strings. If two strings are specified, the first is the target package
        and the second is the target model. If only one string is specified
        then it represents the target model.

        TODO: There should be a way to do this using dbt, and ideally we'll
        transition to doing this whatever that way is, but for the time being
        this was the fastest solution time wise. In addition to resolving the
        ref, this method caches the resolved ref node and uses the cache when
        possible to avoid re-resolving nodes.
        """
        if dbt_metric.model is None:
            raise RuntimeError("Unable to resolve a model for a `DbtMetric.model` value of `None`")

        target_model: Optional[str] = None
        target_package = None

        if dbt_metric.model[:4] == "ref(":
            # Parse the DbtMetric.model into it's parts
            ref_parts = dbt_metric.model[4:-1].split(",")
            if len(ref_parts) == 1:
                target_model = ref_parts[0].strip(" \"'\t\r\n")
            elif len(ref_parts) == 2:
                target_package = ref_parts[0].strip(" \"'\t\r\n")
                target_model = ref_parts[1].strip(" \"'\t\r\n")
            else:
                ref_invalid_args(dbt_metric.name, ref_parts)
        else:
            target_model = dbt_metric.model

        assert target_model is not None, "Failed to set `target_model`"

        hashed = hash((target_model, target_package, self.manifest.metadata.project_id, dbt_metric.package_name))
        if hashed not in self._resolved_dbt_model_refs:
            node = self.manifest.resolve_ref(
                target_model_name=target_model,
                target_model_package=target_package,
                current_project=self.manifest.metadata.project_id or "",
                node_package=dbt_metric.package_name,
            )
            assert isinstance(
                node, DbtModelNode
            ), f"Ref `{dbt_metric.model}` resolved to {node}, which is not of type `{DbtModelNode.__name__}`"

            self._resolved_dbt_model_refs[hashed] = node

        return self._resolved_dbt_model_refs[hashed]

    @classmethod
    def db_table_from_model_node(cls, node: DbtModelNode) -> str:
        """Get the '.' joined database table name of a DbtModelNode"""
        return f"{node.database}.{node.schema}.{node.name}"

    def _build_dimension(self, name: str, dbt_metric: DbtMetric) -> PydanticDimension:
        """Helper for `build_dimenions which builds either a categorical or time dimension"""
        if name in self.time_dimension_stats.keys():
            # print(f'name:{name}')
            return PydanticDimension(
                name=name,
                type=DimensionType.TIME,
                type_params=PydanticDimensionTypeParams(
                    is_primary=dbt_metric.model in self.time_dimension_stats[name], time_granularity=TimeGranularity.DAY
                ),
            )
        else:
            return PydanticDimension(
                name=name,
                type=DimensionType.CATEGORICAL,
            )

    def build_dimensions(self, dbt_metric: DbtMetric) -> List[PydanticDimension]:
        """Given a DbtMetric, builds all the associated MetricFlow dimensions"""
        dimensions = []

        # Build dimensions specifically from DbtMetric.dimensions list
        for dimension in dbt_metric.dimensions:
            dimensions.append(self._build_dimension(name=dimension, dbt_metric=dbt_metric))

        # Add DbtMetric.timestamp as a time dimension
        dimensions.append(self._build_dimension(name=dbt_metric.timestamp, dbt_metric=dbt_metric))

        # We need to deduplicate the filters because a field could be the same in
        # two filters. For example, if two filters exist for `amount`, one with
        # `>= 500` and the other `< 1000`, but only one dimension should be created
        distinct_dbt_metric_filter_fields = set([filter.field for filter in dbt_metric.filters])
        # Add dimension per distinct filter field
        # exclude when field is also listed as a DbtMetric.dimension
        # exclude when field is also the DbtMetric.timestamp
        for filter_field in distinct_dbt_metric_filter_fields:
            if filter_field not in dbt_metric.dimensions and filter_field != dbt_metric.timestamp:
                dimensions.append(self._build_dimension(name=filter_field, dbt_metric=dbt_metric))

        return dimensions

    def build_measure(self, dbt_metric: DbtMetric) -> PydanticMeasure:
        """Attemps to build a measure for a given DbtMetric

        Raises:
            RuntimeError: A measure can't be built for `derived` dbt metrics
        """
        if dbt_metric.calculation_method == "derived":
            raise RuntimeError("Cannot build a MetricFlow measure for `derived` DbtMetric")

        return PydanticMeasure(
            name=dbt_metric.name,
            agg=CALC_METHOD_TO_MEASURE_TYPE[dbt_metric.calculation_method],
            expr=dbt_metric.expression,
            agg_time_dimension=dbt_metric.timestamp,
        )

    def build_data_source_for_metric(self, dbt_metric: DbtMetric) -> PydanticSemanticModel:
        """Attemps to build a data source for a given DbtMetric

        Raises:
            RuntimeError: A data source can't be built for `derived` dbt metrics
        """
        # print(f'Metric timestamp is: {dbt_metric.timestamp}\n\n from {inspect.stack()[0][3]}')
        if dbt_metric.timestamp is None:
            raise RuntimeError(f"Cannot build a MetricFlow data source for DbtMetric {dbt_metric.name} with no timestamp. Please add a timestamp to the metric.")
        if dbt_metric.calculation_method == "derived":
            raise RuntimeError("Cannot build a MetricFlow data source for `derived` DbtMetric")

        metric_model_ref = self.resolve_metric_model(dbt_metric=dbt_metric)
        alias = self.db_table_from_model_node(metric_model_ref).split(".")[-1]
        schema_name = self.db_table_from_model_node(metric_model_ref).split(".")[1]
        return PydanticSemanticModel(
            name=metric_model_ref.name,
            description=metric_model_ref.description,
            node_relation=NodeRelation(alias=alias,schema_name=schema_name),
            dimensions=self.build_dimensions(dbt_metric),
            measures=[self.build_measure(dbt_metric)],
        )

    @classmethod
    def build_where_stmt_from_filters(cls, filters: List[DbtMetricFilter]) -> str:
        """Builds an SQL 'where' statement from the passed in filters

        Each dbt filter has a field, an operator, and a value. With these dbt
        forms the individual statment '{field} {operator} {value}' and joins
        them with an 'AND'. Thus we do the same.

        Note:
            TODO: We could probably replace this with whatever method dbt uses to
            build the statement.
        """
        clauses = [f"{{{{dimension(\'{filter.field}\')}}}} {filter.operator} {filter.value}" for filter in filters]
        return " AND ".join(clauses)

    def build_proxy_metric(self, dbt_metric: DbtMetric) -> PydanticMetric:
        """Attempt to build a proxy metric for the given DbtMetric

        For DbtMetrics which have a calculation method != 'derived',
        we have separately created a measure of the appropriate type.
        This method creates the proxy metric for the measure.

        Raises:
            RuntimeError: A proxy metric can't be built for `derived` dbt metrics
        """
        if dbt_metric.calculation_method == "derived":
            raise RuntimeError("Cannot build a MetricFlow proxy metric for `derived` DbtMetric")

        where_clause_constraint: Optional[PydanticWhereFilter] = None
        if dbt_metric.filters:
            where_clause_constraint = PydanticWhereFilter(
                where_sql_template=self.build_where_stmt_from_filters(filters=dbt_metric.filters),
            )

        # print(metric.filter)
        return PydanticMetric(
            name=dbt_metric.name,
            description=dbt_metric.description,
            type=MetricType.SIMPLE,
            type_params=PydanticMetricTypeParams(
                measure=PydanticMetricInputMeasure(name=dbt_metric.name),
            ),
            filter=where_clause_constraint,
        )

    def dbt_metric_to_metricflow_elements(self, dbt_metric: DbtMetric) -> TransformedDbtMetric:
        """Builds a MetricFlow data source and proxy metric for the given DbtMetric"""
        data_source = self.build_data_source_for_metric(dbt_metric)
        proxy_metric = self.build_proxy_metric(dbt_metric)
        return TransformedDbtMetric(data_source=data_source, metric=proxy_metric)

    @classmethod
    def deduplicate_data_sources(cls, data_sources: List[PydanticSemanticModel]) -> PydanticSemanticModel:
        """Attempts to deduplicate a list of data sources into a single data source

        Because each DbtMetric (which isn't `derived`) creates a data source,
        and many DbtMetric can create the same data source with differring
        defintions for dimensions and measures, we need a way to deduplicate/merge
        them. This function does that. It requires that the base information
        (name/table/query/description/etc) of the data source not be variable and
        that dimensions/measures/identifers with the same name have the same
        attributes.
        """

        if len(data_sources) == 1:
            return data_sources[0]

        # collect the variations of data source properties
        measures: Set[PydanticMeasure] = set()
        entities: Set[PydanticEntity] = set()
        dimensions: Set[PydanticDimension] = set()
        names: Set[str] = set()
        descriptions: Set[str] = set()
        node_relation: Set[str] = set()
        for data_source in data_sources:
            # print(data_source.schema())
            # This is an atypical pattern but results in less work. The following
            # five lines are ternaries wherein the attribute is added to tracking
            # set for the attribute, but only if the attribute is defined for the
            # data source. The `else None` is required because python ternaries
            # require an `else` statement. Having the else be `None` is simply
            # saying nothing happens, i.e. the set is not modified.
            names.add(data_source.name) if data_source.name else None
            descriptions.add(data_source.description) if data_source.description else None
            node_relation.add(data_source.node_relation) if data_source.node_relation else None
            # ensure any unique sub elements get added to the set of sub elements
            measures = measures.union(set(data_source.measures)) if data_source.measures else measures
            identifiers = entities.union(set(data_source.entities)) if data_source.entities else entities
            dimensions = dimensions.union(set(data_source.dimensions)) if data_source.dimensions else dimensions

        assert len(names) == 1, "Cannot merge data sources, all data sources to merge must have same name"
        assert (
            len(descriptions) <= 1
        ), "Cannot merge data sources, all data sources to merge must have same descritpion (or none)"
        assert (
            len(node_relation) <= 1
        ), "Cannot merge data sources, all data sources to merge must have same sql_table (or none)"

        return PydanticSemanticModel(
            name=list(names)[0],
            description=list(descriptions)[0] if descriptions else None,
            node_relation=list(node_relation)[0] if node_relation else None,
            dimensions=list(dimensions),
            identifiers=list(identifiers),
            measures=list(measures),
        )

    @classmethod
    def collect_time_dimension_stats(cls, dbt_metrics: List[DbtMetric]) -> Dict[str, List[str]]:
        """Compiles stats on time dimensions for a given list of DbtMetrics

        Arguably this is probably a fairly black magic function. This function
        determines which time dimensions are primary for which `DbtMetric.model`
        """
        # For storing the time dimension names and the `DbtMetric.model`s they are primary for
        time_dimensions: Dict[str, List[str]] = {}

        # Map each `DbtMetric.model` value to counts of how many times each time
        # dimension is associated with it. The time dimension that is associated
        # with a `DbtMetric.model` the most will be considered the primary time
        # dimenson for the data source that is built for the `DbtMetric.model`
        time_stats_for_metric_models: Dict[str, Dict[str, int]] = {}
        for dbt_metric in dbt_metrics:
            if dbt_metric.calculation_method != "derived" and dbt_metric.model is not None and dbt_metric.timestamp is not None:
                if dbt_metric.timestamp not in time_dimensions:
                    time_dimensions[dbt_metric.timestamp] = []
                if dbt_metric.model not in time_stats_for_metric_models:
                    time_stats_for_metric_models[dbt_metric.model] = {dbt_metric.timestamp: 1}
                if dbt_metric.model in time_stats_for_metric_models and list(time_stats_for_metric_models[dbt_metric.model].keys())[0] != dbt_metric.timestamp:
                    pass
                else:
                    time_stats_for_metric_models[dbt_metric.model][dbt_metric.timestamp] += 1
         
        # Take the mapping created above and set the `DbtMetric.model` values
        # that should be primary for the time dimension
        #print(time_stats_for_metric_models)
        for metric_model, time_stats in time_stats_for_metric_models.items():
            primary_time_dim = max(time_stats, key=time_stats.get)  # type: ignore
            time_dimensions[primary_time_dim].append(metric_model)
        return time_dimensions

    def build_user_configured_model(self) -> SemanticManifestBuildResult:
        """Builds a UserConfiguredModel from the manifest of the instance

        Note:
            TODO: This currently skips DbtMetric that are `derived`. Once MetricFlow
            supports derived metrics, we'll need to add that functionality to
            handle dbt derived metrics -> metricflow derived metrics.
        """
        data_sources_map: DefaultDict[str, List[PydanticSemanticModel]] = defaultdict(list)
        metrics = []
        issues: List[ValidationIssue] = []
        
        for dbt_metric in self.manifest.metrics.values():
            # TODO: Handle derived dbt metricsfsd
            if dbt_metric.calculation_method == "derived":
                continue
            else:
                transformed_dbt_metric = self.dbt_metric_to_metricflow_elements(dbt_metric=dbt_metric)
                # print(transformed_dbt_metric.metric.filter)
                data_sources_map[transformed_dbt_metric.data_source.name].append(transformed_dbt_metric.data_source)
                metrics.append(transformed_dbt_metric.metric)

        # As it might be the case that we generated many of the same data source,
        # we need to merge / dedupe them
        deduped_data_sources = []
        for name, data_sources in data_sources_map.items():
            try:
                deduped_data_sources.append(self.deduplicate_data_sources(data_sources))
            except Exception as e:
                issues.append(
                    ValidationError(
                        message=f"Failed to merge data sources with the name `{name}`",
                        extra_detail="".join(traceback.format_tb(e.__traceback__)),
                    )
                )

        return SemanticManifestBuildResult(
            PydanticSemanticManifest(semantic_models=list(deduped_data_sources), metrics=metrics),
            SemanticManifestValidationResults.from_issues_sequence(issues=issues),
        )
