from fastapi import FastAPI
from app.routes.dashboard import router as dashboard_router

app = FastAPI(title="Hospital Analytics API")

app.include_router(dashboard_router)

@app.get("/")
def root():
    return {"status": "API is running"}
