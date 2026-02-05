INSERT INTO patients (age, gender, insurance_type, branch) VALUES
(45,'Male','Private','Chennai'),
(60,'Female','Government','Bangalore'),
(30,'Male','Private','Hyderabad'),
(10,'Female','Government','Chennai'),
(70,'Male','Private','Bangalore');

INSERT INTO admissions (patient_id, department, admission_time, discharge_time, admission_type) VALUES
(1,'Cardiology','2026-01-10 10:00','2026-01-15 14:00','Emergency'),
(2,'Oncology','2026-01-05 09:00','2026-01-20 12:00','Scheduled'),
(3,'Orthopedics','2026-01-18 18:00','2026-01-22 10:00','Emergency'),
(4,'Pediatrics','2026-01-25 08:00','2026-01-27 11:00','Scheduled'),
(5,'General Medicine','2026-01-12 14:00','2026-01-18 09:00','Emergency');

INSERT INTO doctors (department, available_hours, booked_hours) VALUES
('Cardiology',160,140),
('Oncology',160,150),
('Orthopedics',160,110),
('Pediatrics',160,90),
('General Medicine',160,155);

INSERT INTO procedures (department, procedure_type, procedure_date) VALUES
('Cardiology','Angioplasty','2026-01-11'),
('Oncology','Chemotherapy','2026-01-06'),
('Orthopedics','Fracture Fixation','2026-01-19'),
('Pediatrics','Vaccination','2026-01-26'),
('General Medicine','Dialysis','2026-01-13');

INSERT INTO billing (patient_id, total_cost, doctor_fee, resource_cost) VALUES
(1,150000,50000,100000),
(2,300000,120000,180000),
(3,90000,30000,60000),
(4,25000,8000,17000),
(5,70000,20000,50000);

INSERT INTO outcomes (patient_id, outcome, readmitted_30_days) VALUES
(1,'Recovered',FALSE),
(2,'Improved',TRUE),
(3,'Recovered',FALSE),
(4,'Recovered',FALSE),
(5,'Transferred',TRUE);
