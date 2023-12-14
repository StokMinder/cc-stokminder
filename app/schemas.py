# schemas.py
from pydantic import BaseModel

class ProductCreate(BaseModel):
    name: str
    category: str

class Product(BaseModel):
    id: int
    name: str
    category: str

    class Config:
        from_attributes = True
