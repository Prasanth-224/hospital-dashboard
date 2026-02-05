from app.database import get_db

def fetch_kpis():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT 
            COUNT(*) AS total_admissions,
            ROUND(AVG(length_of_stay),2) AS avg_length_of_stay,
            ROUND(AVG(readmitted)*100,2) AS readmission_rate,
            ROUND(SUM(is_emergency)/COUNT(*)*100,2) AS emergency_percentage
        FROM admissions
    """)

    data = cursor.fetchone()
    db.close()
    return data


def department_los():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            department,
            ROUND(AVG(DATEDIFF(discharge_time, admission_time)), 2) AS avg_los
        FROM admissions
        GROUP BY department
    """)

    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return data

def admission_peak_hours():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            HOUR(admission_time) AS hour_of_day,
            COUNT(*) AS admissions_count
        FROM admissions
        GROUP BY hour_of_day
        ORDER BY admissions_count DESC
    """)

    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return data

def kpi_summary():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            COUNT(*) AS total_admissions,
            SUM(CASE WHEN discharge_time IS NOT NULL THEN 1 ELSE 0 END) AS total_discharges,
            ROUND(AVG(DATEDIFF(discharge_time, admission_time)), 2) AS avg_los
        FROM admissions
    """)

    data = cursor.fetchone()
    cursor.close()
    conn.close()
    return data

def doctor_utilization():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            department,
            ROUND((SUM(booked_hours) / SUM(available_hours)) * 100, 2) AS utilization_percent
        FROM doctors
        GROUP BY department
    """)

    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return data




