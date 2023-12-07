from typing import List, Optional, Tuple

from dbt_semantic_interfaces.type_enums.time_granularity import TimeGranularity
from dbt_semantic_interfaces.implementations.elements.dimension import (
    PydanticDimensionTypeParams,
)
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from dbt_semantic_interfaces.implementations.elements.dimension import (
    PydanticDimension,
)
from metricflow.specs.specs import DEFAULT_TIME_GRANULARITY
from pydantic import BaseModel


class LookMLDimension(BaseModel):
    name: str
    type: Optional[str]

    def _get_grain(self) -> TimeGranularity:
        if any([t in self.type for t in ["second", "hour"]]):
            return TimeGranularity.DAY
        granularities = [
            granularity
            for granularity in TimeGranularity
            if granularity.value.lower() in self.type
        ]
        if granularities:
            return granularities[0]
        return DEFAULT_TIME_GRANULARITY

    def get_dimension_type(
        self,
    ) -> Tuple[DimensionType, Optional[PydanticDimensionTypeParams]]:
        if any([self.type.startswith(t) for t in ["duration", "date", "time"]]):
            return (
                DimensionType.TIME,
                PydanticDimensionTypeParams(time_granularity=self._get_grain()),
            )
        return DimensionType.CATEGORICAL, None


def to_sl_dimensions(dimensions: List[LookMLDimension]) -> List[PydanticDimension]:
    sl_dimensions: List[PydanticDimension] = []
    for dimension in dimensions:
        if not dimension.type:
            continue
        dim_type, dim_type_param = dimension.get_dimension_type()
        sl_dimensions.append(
            PydanticDimension(
                name=dimension.name,
                type=dim_type,
                type_params=dim_type_param,
            )
        )
    return sl_dimensions
