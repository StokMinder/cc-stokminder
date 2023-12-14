# schemas.py
from pydantic import BaseModel
from typing import Optional
from datetime import date, datetime
from typing import List

# Field JSON yang dikirim dari Request
class ProductCreate(BaseModel):
    name: str
    category: str

# Skema product utuh
class Product(BaseModel):
    id: int
    name: str
    category: str

    class Config:
        from_attributes = True

# Field JSON dalam list [4 item dalam sekali request]
class StockItem(BaseModel):
    product_id: int
    quantity: int

# Field dari request
class StockCreate(BaseModel):
    user_id: int
    stock_date: date
    stock_items: List[StockItem]

# Skema stock utuh
class Stock(BaseModel):
    id: int
    user_id: int
    product_id: int
    quantity: int
    stock_date: date
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

# model response agar bisa berbentuk string json
class StockResponse(BaseModel):
    message: str

class StockUpdate(BaseModel):
    quantity: int