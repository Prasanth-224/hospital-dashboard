from fastapi import APIRouter
from app.crud import department_los, admission_peak_hours,kpi_summary,doctor_utilization
from app.utils import los_risk_flag

router = APIRouter(prefix="/dashboard", tags=["Dashboard"])

@router.get("/department-los")
def get_department_los():
    data = department_los()
    for row in data:
        row["risk_flag"] = los_risk_flag(row["avg_los"])
    return data

@router.get("/admission-peak-hours")
def get_peak_hours():
    return admission_peak_hours()

@router.get("/kpi-summary")
def get_kpi_summary():
    return kpi_summary()

@router.get("/doctor_utilization")
def get_doctor_utilization():
    return doctor_utilization
