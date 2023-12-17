# main.py
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
import models
import functions
import schemas

app = FastAPI()


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
async def read_products(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return functions.get_products(db, skip=skip, limit=limit)

# Add 1 Product
@app.post("/products/", response_model=schemas.Product)
async def create_product(product: schemas.ProductCreate, db: Session = Depends(get_db)):
    return functions.create_product(db, product)

# Add/Update Stock 4 item langsung
@app.post("/add-stock/", response_model=schemas.StringResponse)
async def add_stock(stock: schemas.StockCreate, db: Session = Depends(get_db)):
    user_id = stock.user_id
    stock_date = stock.stock_date
    stock_items = stock.stock_items
    
    for item in stock_items:
        functions.add_stock(db, item, user_id, stock_date)
    
    return {"message": "Stock added successfully for all products"}

# Add/Update Sales 4 item langsung
@app.post("/add-sales/", response_model=schemas.StringResponse)
async def add_sales(sales: schemas.SalesCreate, db: Session = Depends(get_db)):
    user_id = sales.user_id
    sales_date = sales.sales_date
    sales_items = sales.sales_items
    
    for item in sales_items:
        functions.add_sales(db, item, user_id, sales_date)
    
    return {"message": "Sales recap added successfully for all products"}

@app.get("/best-sellers/", response_model=list[schemas.BestSellers])
async def get_best_sellers(user_id: int, db: Session = Depends(get_db)):
    best_sellers = functions.get_best_sellers(db, user_id)
    return best_sellers

# Add output recomendation to DB
# @app.post("/predict", status_code=201)
# def add_recommendation(recommendation_input: RecommendationInput, db: Session = Depends(get_db)):
#     id_user = recommendation_input.id_user
#     tanggal = recommendation_input.tanggal
#     rekomendasi = recommendation_input.rekomendasi
    
#     new_recommendation = Recommendation(id_user=id_user, tanggal=tanggal, rekomendasi=rekomendasi)
#     db.add(new_recommendation)
#     db.commit()
    
#     return {"message": "Data Updated!"}
