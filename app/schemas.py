# schemas.py
from pydantic import BaseModel
from typing import Optional
from datetime import date, datetime
from typing import List

""" 
    Products
"""
# model response agar bisa berbentuk string json
class StringResponse(BaseModel):
    message: str

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

""" 
    Stock
"""
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

class StockUpdate(BaseModel):
    quantity: int

""" 
    Sales
"""
# Field JSON dalam list [4 item dalam sekali request]
class SalesItem(BaseModel):
    product_id: int
    quantity: int

# Field dari request
class SalesCreate(BaseModel):
    user_id: int
    sales_date: date
    sales_items: List[SalesItem]

# Skema sales utuh
class Sales(BaseModel):
    id: int
    user_id: int
    product_id: int
    quantity: int
    sales_date: date
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

class SalesUpdate(BaseModel):
    quantity: int

class BestSellers(BaseModel):
    product_id: int
    product_name: str
    total_quantity: int