from typing import List, Optional

from pydantic import BaseModel
from converter.lookml.dimension import LookMLDimension

from converter.lookml.measure import LookMLMeasure


class LookMLView(BaseModel):
    sql_table_name: Optional[str]
    name: str
    measures: Optional[List[LookMLMeasure]]
    dimensions: List[LookMLDimension]


class LookMLModel(BaseModel):
    views: Optional[List[LookMLView]]
