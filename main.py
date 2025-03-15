from fastapi import FastAPI

app = FastAPI()

@app.get("/inventory")
def check_inventory():
    return {"message": "Medical inventory data here!"}

# Required to run Uvicorn when the script is executed directly
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000)
