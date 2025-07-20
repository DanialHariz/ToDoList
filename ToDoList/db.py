from pymongo import MongoClient
from dotenv import load_dotenv
import os

# Load environment variables from .env

load_dotenv()

MONGO_URI = os.getenv("MONGO_URI")


try:
    print("MONGO_URI:", MONGO_URI)
    client = MongoClient(MONGO_URI, serverSelectionTimeoutMS=5000)
    # Try to ping the server
    client.admin.command('ping')
    print("✅ MongoDB connection successful")
except Exception as e:
    print(f"❌ MongoDB connection failed: {e}")
    raise

def get_db():
    """Returns the database handle."""
    return client["ToDo"]
