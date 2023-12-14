# functions.py
from sqlalchemy.orm import Session
from models import Product
from schemas import ProductCreate
from models import Stock
from schemas import StockItem
from datetime import datetime, date

def create_product(db: Session, product: ProductCreate):
    db_product = Product(**product.dict())
    db.add(db_product)
    db.commit()
    db.refresh(db_product)
    return db_product

def get_products(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Product).offset(skip).limit(limit).all()

def add_stock(db: Session, stock_item: StockItem, user_id: int, stock_date: date):
    db_stock = Stock(**stock_item.dict(), user_id=user_id, stock_date=stock_date)
    db.add(db_stock)
    db.commit()
    db.refresh(db_stock)
    return db_stock

def update_stock(db: Session, stock_id: int, quantity: int):
    db_stock = db.query(Stock).filter(Stock.id == stock_id).first()
    if db_stock:
        db_stock.quantity = quantity
        db_stock.updated_at = datetime.utcnow()
        db.commit()
        db.refresh(db_stock)
        return db_stock
    return None
