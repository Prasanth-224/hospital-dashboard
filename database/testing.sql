SELECT * FROM patients;
SELECT * FROM admissions;
SELECT * FROM doctors;
SELECT * FROM billing;
SELECT * FROM outcomes;


SELECT 
    ROUND(AVG(DATEDIFF(discharge_time, admission_time)), 2) AS avg_length_of_stay_days
FROM admissions
WHERE discharge_time IS NOT NULL;


SELECT 
    COUNT(*) AS total_admissions,
    SUM(CASE WHEN discharge_time IS NOT NULL THEN 1 ELSE 0 END) AS total_discharges
FROM admissions;

SELECT 
    admission_type,
    COUNT(*) AS case_count
FROM admissions
GROUP BY admission_type;

SELECT 
    ROUND(
        (SUM(CASE WHEN readmitted_30_days = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS readmission_rate_percent
FROM outcomes;

SELECT
    department,
    ROUND((SUM(booked_hours) / SUM(available_hours)) * 100, 2) AS doctor_utilization_percent
FROM doctors
GROUP BY department;

SELECT
    ROUND(AVG(total_cost), 2) AS avg_cost_per_patient
FROM billing;

SELECT
    outcome,
    COUNT(*) AS patient_count
FROM outcomes
GROUP BY outcome;

SELECT
    department,
    ROUND(AVG(DATEDIFF(discharge_time, admission_time)), 2) AS avg_stay_days
FROM admissions
GROUP BY department;

SELECT
    HOUR(admission_time) AS hour_of_day,
    COUNT(*) AS admissions_count
FROM admissions
GROUP BY hour_of_daydepartment
ORDER BY admissions_count DESC;