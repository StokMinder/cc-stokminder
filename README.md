# StokMinder FastAPI Backend

StokMinder is a FastAPI-based backend for a mobile application that predicts sales and provides restocking recommendations based on daily sales data.

## Prerequisites

Before you begin, make sure you have the following installed on your machine:

- [Python](https://www.python.org/downloads/) (>= 3.7)
- [MySQL Server](https://dev.mysql.com/downloads/mysql/)

## Clone the Repository

```bash
git clone https://github.com/your-username/stokminder-fastapi.git
cd stokminder-fastapi
```

## Setup Environment
```bash
# On Windows
python -m venv venv
venv\Scripts\activate

# On macOS/Linux
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

## Configure Environment Variables
Create a .env file in the root directory with the following content:
```bash
DATABASE_URL=mysql+mysqlconnector://your_mysql_username:your_mysql_password@localhost/stokminder
```
Replace your_mysql_username and your_mysql_password with your actual MySQL username and password.

Run the FastAPI Application
```bash
uvicorn main:app --reload
```
Visit http://127.0.0.1:8000/docs in your browser to access the Swagger documentation and test the API endpoints interactively.