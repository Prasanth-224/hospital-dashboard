# hospital-dashboard

Interactive analytics dashboard for hospital operations to monitor admissions, bed usage, doctor workloads, procedures, discharges, and patient outcomes across departments. Highlights bottlenecks, predicts resource needs, compares branches, and supports data-driven staffing and capacity planning decisions.





\## Architecture

MySQL (On-Prem) → FastAPI ETL → Power BI Dashboard → PDF/CSV Reports



\## KPIs Explained

\- Total Admissions

\- Average Length of Stay

\- Readmission Rate

\- Emergency vs Scheduled Cases

\- Procedure Volume

\- Branch-wise Performance



\## Bottleneck Logic

\- Departments with LOS above hospital average flagged as High Risk

\- Peak hour admission congestion identified

\- Emergency-heavy departments highlighted



\## Prediction Logic

\- Admission trend forecasting using time-series analysis

\- Emergency admission ratio used as proxy for ICU \& ventilator demand



\## Tools Used

\- MySQL (On-Premise)

\- FastAPI (Backend \& ETL)

\- Power BI (Visualization \& Reporting)

\- Python (pandas, sqlalchemy)



\## How to Run Locally

1\. Load database using schema.sql and sample\_data.sql

2\. Install backend dependencies

3\. Run FastAPI using uvicorn

4\. Open Power BI file and connect to database



