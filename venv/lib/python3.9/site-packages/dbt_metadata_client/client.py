from typing import Any, Dict, List, Union

from sgqlc.endpoint.http import HTTPEndpoint
from sgqlc.operation import Operation

from dbt_metadata_client.dbt_metadata_api_schema import (
    ExposureNode,
    MacroNode,
    MetricNode,
    ModelNode,
    SeedNode,
    SnapshotNode,
    SourceNode,
    TestNode,
    dbt_metadata_api_schema,
)


class Client:
    """A client for requesting data from dbt's Metadata API and parsing it into objects"""

    def __init__(  # noqa: D
        self, api_token: str, dbt_metadata_api_url: str = "https://metadata.cloud.getdbt.com/graphql"
    ) -> None:
        headers = {"Authorization": f"token {api_token}"}
        self.endpoint = HTTPEndpoint(url=dbt_metadata_api_url, base_headers=headers)

    def query_operation(self, operation: Operation) -> Union[Any, Dict[str, Any]]:  # type: ignore[misc]
        """Simple query helper which takes in an SGQLC Operation"""
        return self.endpoint(query=operation)

    def get_exposures(self, job_id: int) -> List[ExposureNode]:
        """Get the Exposures associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.exposures(job_id=job_id)
        data = self.query_operation(operation=query_op)
        exposures: List[ExposureNode] = (query_op + data).exposures
        return exposures

    def get_macros(self, job_id: int) -> List[MacroNode]:
        """Get the Sources associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.macros(job_id=job_id)
        data = self.query_operation(operation=query_op)
        macros: List[MacroNode] = (query_op + data).macros
        return macros

    def get_metrics(self, job_id: int) -> List[MetricNode]:
        """Get the Metrics associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.metrics(job_id=job_id)
        data = self.query_operation(operation=query_op)
        metrics: List[MetricNode] = (query_op + data).metrics
        return metrics

    def get_models(self, job_id: int) -> List[ModelNode]:
        """Get the Models associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.models(job_id=job_id)
        data = self.query_operation(operation=query_op)
        models: List[ModelNode] = (query_op + data).models
        return models

    def get_snapshots(self, job_id: int) -> List[SnapshotNode]:
        """Get the Snapshots associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.snapshots(job_id=job_id)
        data = self.query_operation(operation=query_op)
        snapshots: List[SnapshotNode] = (query_op + data).snapshots
        return snapshots

    def get_seeds(self, job_id: int) -> List[SeedNode]:
        """Get the Seeds associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.seeds(job_id=job_id)
        data = self.query_operation(operation=query_op)
        seeds: List[SeedNode] = (query_op + data).seeds
        return seeds

    def get_sources(self, job_id: int) -> List[SourceNode]:
        """Get the Sources associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.sources(job_id=job_id)
        data = self.query_operation(operation=query_op)
        sources: List[SourceNode] = (query_op + data).sources
        return sources

    def get_tests(self, job_id: int) -> List[TestNode]:
        """Get the Tests associated with a dbt job"""
        query_op = Operation(dbt_metadata_api_schema.Query)
        query_op.tests(job_id=job_id)
        data = self.query_operation(operation=query_op)
        tests: List[TestNode] = (query_op + data).tests
        return tests
