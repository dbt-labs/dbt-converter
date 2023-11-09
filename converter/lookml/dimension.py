from itertools import takewhile
import os
import lkml
from typing import Iterator, List, Optional, Tuple

from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.type_enums.time_granularity import TimeGranularity
from dbt_semantic_interfaces.implementations.elements.dimension import (
    PydanticDimension,
    PydanticDimensionTypeParams,
)
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from dbt_semantic_interfaces.implementations.semantic_manifest import (
    PydanticSemanticManifest,
)
from dbt_semantic_interfaces.implementations.semantic_model import NodeRelation
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure
from pydantic import BaseModel

DEFAULT_TIME_GRANULARITY = TimeGranularity.DAY


class LkmlDimension(BaseModel):
    name: str
    type: Optional[str]  # TODO: make this a different type


def get_dimension_type(
    lkmlDimension: LkmlDimension,
) -> Tuple[DimensionType, Optional[PydanticDimensionTypeParams]]:
    dimension_type_map = {
        "bin": DimensionType.CATEGORICAL,
        "date": DimensionType.TIME,
        "date_time": DimensionType.TIME,
        "distance": DimensionType.CATEGORICAL,
        "duration": DimensionType.TIME,
        "location": DimensionType.CATEGORICAL,
        "number": DimensionType.CATEGORICAL,
        "string": DimensionType.CATEGORICAL,
        "tier": DimensionType.CATEGORICAL,
        "time": DimensionType.TIME,
        "unquoted": DimensionType.CATEGORICAL,
        "yesno": DimensionType.CATEGORICAL,
        "zipcode": DimensionType.CATEGORICAL,
        "int": DimensionType.CATEGORICAL,
    }

    def get_duration_grain(lkmlDimension: LkmlDimension) -> TimeGranularity:
        split = lkmlDimension.type.split("_")
        if len(split) == 1:
            return DEFAULT_TIME_GRANULARITY
        grain = split[1]
        if grain == "hour" or grain == "minute" or grain == "second":
            return TimeGranularity.DAY
        return TimeGranularity.for_name(
            grain.upper()
        )  # TODO: make upper unnecessary here in for_name

    def get_date_grain(lkmlDimension: LkmlDimension) -> TimeGranularity:
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

    def get_grain(lkmlDimension: LkmlDimension) -> TimeGranularity:
        if lkmlDimension.type.startswith("duration"):
            return get_duration_grain(lkmlDimension)
        elif lkmlDimension.type.startswith("date"):
            return get_date_grain(lkmlDimension)

    if lkmlDimension.type.startswith("duration") or lkmlDimension.type.startswith(
        "date"
    ):
        return (
            DimensionType.TIME,
            PydanticDimensionTypeParams(time_granularity=get_grain(lkmlDimension)),
        )
    return dimension_type_map[lkmlDimension.type], None
