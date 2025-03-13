from fastapi import FastAPI
app = FastAPI()
@app.get("/inventory")
def check_inventory():
return {"message": "Medical inventory data here!"}
