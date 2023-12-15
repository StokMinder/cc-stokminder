# functions.py
from sqlalchemy import func, desc
from sqlalchemy.orm import Session
from models import Product, Stock, Sales
from schemas import ProductCreate, BestSellers
from datetime import datetime, date, timedelta

def create_product(db: Session, product: ProductCreate):
    db_product = Product(**product.dict())
    db.add(db_product)
    db.commit()
    db.refresh(db_product)
    return db_product

def get_products(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Product).offset(skip).limit(limit).all()

""" 
    Menambahkan data baru bila user_id dan stock_date belum ada di DB.
    Mengubah quantity, jika user_id atau stock_date sudah ada di DB.
"""
def add_stock(db: Session, stock_item, user_id: int, stock_date: date):
    product_id = stock_item.product_id
    quantity = stock_item.quantity
    
    existing_stock = db.query(Stock).filter_by(user_id=user_id, stock_date=stock_date, product_id=product_id).first()

    if existing_stock:
        # Update quantity if the entry already exists
        existing_stock.quantity = quantity
    else:
        # Insert a new entry if it doesn't exist
        new_stock = Stock(user_id=user_id, stock_date=stock_date, product_id=product_id, quantity=quantity)
        db.add(new_stock)
    
    db.commit()

    if existing_stock:
        db.refresh(existing_stock)  # Refresh the object only if it's not None

    return existing_stock or new_stock

"""
    Menambahkan data baru bila user_id dan sales_date belum ada di DB.
    Mengubah quantity, jika user_id atau sales_date sudah ada di DB.
"""
def add_sales(db: Session, sales_item, user_id: int, sales_date: date):
    product_id = sales_item.product_id
    quantity = sales_item.quantity
    
    existing_sales = db.query(Sales).filter_by(user_id=user_id, sales_date=sales_date, product_id=product_id).first()

    if existing_sales:
        # Update quantity if the entry already exists
        existing_sales.quantity = quantity
    else:
        # Insert a new entry if it doesn't exist
        new_sales = Sales(user_id=user_id, sales_date=sales_date, product_id=product_id, quantity=quantity)
        db.add(new_sales)
    
    db.commit()

    if existing_sales:
        db.refresh(existing_sales)  # Refresh the object only if it's not None

    return existing_sales or new_sales

def get_best_sellers(db: Session, user_id: int):
    # Calculate the date one week ago
    last_week = date.today() - timedelta(days=7)
    
    # Query to get the top 3 best sellers for the given user_id in the last week
    best_sellers_query = (
        db.query(Sales.product_id, Product.name, func.sum(Sales.quantity).label("total_quantity"))
        .join(Product, Sales.product_id == Product.id)
        .filter(Sales.user_id == user_id, Sales.sales_date >= last_week)
        .group_by(Sales.product_id)
        .order_by(desc("total_quantity"))
        .limit(3)
    )

    print(best_sellers_query)
    # Execute the query and retrieve the results
    best_sellers = best_sellers_query.all()

    # Map the results to the BestSellers model
    best_sellers_response = [
        BestSellers(product_id=product_id, product_name=product_name, total_quantity=total_quantity)
        for product_id, product_name, total_quantity in best_sellers
    ]

    return best_sellers_response