from typing import List, Optional
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from pydantic import BaseModel


class LkmlMeasure(BaseModel):
    name: str
    type: Optional[str]


def to_sl_measures(measures: Optional[List[LkmlMeasure]]) -> List[PydanticMeasure]:
    measure_type_map = {
        "average": AggregationType.AVERAGE,
        "average_distinct": AggregationType.AVERAGE,
        "count": AggregationType.COUNT,
        "count_distinct": AggregationType.COUNT_DISTINCT,
        "date": AggregationType.COUNT,
        "list": AggregationType.COUNT,
        "max": AggregationType.MAX,
        "median": AggregationType.MEDIAN,
        "median_distinct": AggregationType.MEDIAN,
        "min": AggregationType.MIN,
        "number": AggregationType.COUNT,  # TODO: sum?
        "percent_of_previous": AggregationType.PERCENTILE,
        "percent_of_total": AggregationType.PERCENTILE,
        "percentile": AggregationType.PERCENTILE,
        "percentile_distinct": AggregationType.PERCENTILE,
        "running_total": AggregationType.SUM,
        "string": AggregationType.COUNT,
        "sum": AggregationType.SUM,
        "sum_distinct": AggregationType.SUM,
        "yesno": AggregationType.SUM_BOOLEAN,
        "int": AggregationType.COUNT,
    }
    sl_measures: List[PydanticMeasure] = []
    for measure in measures or []:
        if not measure.type:
            continue
        sl_measures.append(
            PydanticMeasure(
                name=measure.name,
                agg=measure_type_map[measure.type],
                create_metric=True,
            )
        )
    return sl_measures
