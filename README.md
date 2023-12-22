# StokMinder FastAPI Backend

StokMinder is a FastAPI-based backend for a mobile application that predicts sales and provides restocking recommendations based on daily sales data.

## The Swagger Documentation and Test The API :

A. Backend :
https://stokminder-ch2-ps429.et.r.appspot.com/

B. API Documentation :
https://stokminder-ch2-ps429.et.r.appspot.com/docs

## Prerequisites

Before you begin, make sure you have the following installed on your machine:

- [Python](https://www.python.org/downloads/) (>= 3.7)

## Clone the Repository

```bash
git clone https://github.com/StokMinder/cc-stokminder.git
cd cc-stokminder
```

## Setup Environment
```bash
# On Windows
virtualenv venv2
venv2\Scripts\activate.ps1

# Install dependencies
pip install -r requirements.txt
```

## Configure Environment Variables
Create a .env file in the root directory with the following content:
```bash
INSTANCE_CONNECTION_NAME="stokminder-dev:us-central1:db-stokminder"
DB_USER="mario"
DB_PASS="password"
DB_NAME="stokminder"
PRIVATE_IP=False
GOOGLE_APPLICATION_CREDENTIALS="app/key.json"
```
Replace your_mysql_username and your_mysql_password with your actual MySQL username and password.

Run the FastAPI Application
```bash
uvicorn main:app --host 127.0.0.1 --port 8000 --reload
```
--reload for debugging purposes

Visit http://127.0.0.1:8000/docs in your browser to access the Swagger documentation and test the API endpoints interactively.
