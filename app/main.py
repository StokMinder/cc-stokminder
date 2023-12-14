# main.py
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal, engine
import models
import functions
import schemas

app = FastAPI()

# Create tables
models.Base.metadata.create_all(bind=engine)

# Dependency to get the database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"Hello": "World"}

# Get All Products
@app.get("/products/", response_model=list[schemas.Product])
async def read_products(skip: int = 0, limit: int = 4, db: Session = Depends(get_db)):
    return functions.get_products(db, skip=skip, limit=limit)

# Add 1 Product
@app.post("/products/", response_model=schemas.Product)
async def create_product(product: schemas.ProductCreate, db: Session = Depends(get_db)):
    return functions.create_product(db, product)

@app.post("/stock/", response_model=schemas.StockResponse)
async def add_stock(stock: schemas.StockCreate, db: Session = Depends(get_db)):
    user_id = stock.user_id
    stock_date = stock.stock_date
    stock_items = stock.stock_items
    
    for item in stock_items:
        functions.add_stock(db, item, user_id, stock_date)
    
    return {"message": "Stock added successfully for all products"}

@app.put("/stock/{stock_id}/", response_model=schemas.Stock)
async def update_stock(stock_id: int, update_data: schemas.StockUpdate, db: Session = Depends(get_db)):
    updated_stock = functions.update_stock(db, stock_id, update_data.quantity)
    if updated_stock:
        return updated_stock
    raise HTTPException(status_code=404, detail="Stock not found")