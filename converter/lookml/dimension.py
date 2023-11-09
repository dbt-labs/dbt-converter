from typing import Optional, Tuple

from dbt_semantic_interfaces.type_enums.time_granularity import TimeGranularity
from dbt_semantic_interfaces.implementations.elements.dimension import (
    PydanticDimensionTypeParams,
)
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from pydantic import BaseModel

DEFAULT_TIME_GRANULARITY = TimeGranularity.DAY


class LkmlDimension(BaseModel):
    name: str
    type: Optional[str]


def get_dimension_type(
    lkmlDimension: LkmlDimension,
) -> Tuple[DimensionType, Optional[PydanticDimensionTypeParams]]:
    def get_grain(lkmlDimension: LkmlDimension) -> TimeGranularity:
        if any([t in lkmlDimension.type for t in ["second", "hour", "day"]]):
            return TimeGranularity.DAY
        if "week" in lkmlDimension.type:
            return TimeGranularity.WEEK
        if "month" in lkmlDimension.type:
            return TimeGranularity.MONTH
        if "quarter" in lkmlDimension.type:
            return TimeGranularity.QUARTER
        if "year" in lkmlDimension.type:
            return TimeGranularity.YEAR
        return DEFAULT_TIME_GRANULARITY

    if any([lkmlDimension.type.startswith(t) for t in ["duration", "date", "time"]]):
        return (
            DimensionType.TIME,
            PydanticDimensionTypeParams(time_granularity=get_grain(lkmlDimension)),
        )
    return DimensionType.CATEGORICAL, None
