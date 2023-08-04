# Import required modules and classes
from typing import Union
from fastapi import FastAPI
import socket, datetime

# Create an object from FastAPI class
app = FastAPI()

# Return Hostname, Current Time and Timestamp information when the application's root path is accessed
@app.get("/")
def read_root():
    return {"Hostname": socket.gethostname(), "Current Time": datetime.datetime.now(), "Timestamp": datetime.datetime.now().timestamp()}
