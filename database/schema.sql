CREATE DATABASE hospital_analytics;
USE hospital_analytics;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT,
    gender ENUM('Male','Female','Other'),
    insurance_type VARCHAR(50),
    branch VARCHAR(50)
);

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    department VARCHAR(50),
    admission_time DATETIME,
    discharge_time DATETIME,
    admission_type ENUM('Emergency','Scheduled'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(50),
    available_hours INT,
    booked_hours INT
);

CREATE TABLE procedures (
    procedure_id INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(50),
    procedure_type VARCHAR(100),
    procedure_date DATE
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    total_cost DECIMAL(10,2),
    doctor_fee DECIMAL(10,2),
    resource_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE outcomes (
    patient_id INT PRIMARY KEY,
    outcome ENUM('Recovered','Improved','Transferred','Deceased'),
    readmitted_30_days BOOLEAN,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
