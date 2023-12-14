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

@app.post("/products/", response_model=schemas.Product)
async def create_product(product: schemas.ProductCreate, db: Session = Depends(get_db)):
    return functions.create_product(db, product)

@app.get("/products/", response_model=list[schemas.Product])
async def read_products(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return functions.get_products(db, skip=skip, limit=limit)
