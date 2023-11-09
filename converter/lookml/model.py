from typing import List, Optional

from pydantic import BaseModel
from converter.lookml.dimension import LkmlDimension

from converter.lookml.measure import LkmlMeasure


class LkmlView(BaseModel):
    sql_table_name: Optional[str]
    name: str
    measures: Optional[List[LkmlMeasure]]
    dimensions: List[LkmlDimension]


class LkmlModel(BaseModel):
    views: Optional[List[LkmlView]]
