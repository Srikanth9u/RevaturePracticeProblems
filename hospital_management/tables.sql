/* Complete the queries below to create the six tables. */

-- Creating Doctors Table
CREATE TABLE Doctors (
    DoctorID int PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Specialization varchar(100),
    ContactNumber varchar(15),
    Email varchar(100) NOT NULL
);

-- Creating Patients Table
CREATE TABLE Patients (
    PatientID int PRIMARY KEY,
    Name varchar(100) NOT NULL,
    DOB date,
    Gender text CHECK (Gender IN ('Male', 'Female', 'Other')),
    ContactNumber varchar(15),
    Address text
);

-- Creating Appointments Table
CREATE TABLE Appointments (
    AppointmentID int PRIMARY KEY,
    PatientID int,
    DoctorID int,
    AppointmentDate date,
    Status text CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    FOREIGN KEY (PatientID) REFERENCES Patients (PatientID) ON DELETE set NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE set null
);

-- Creating Treatments Table
CREATE TABLE Treatments (
    TreatmentID int PRIMARY KEY,
    PatientID int,
    DoctorID int,
    Diagnosis varchar(255),
    TreatmentDescription text,
    TreatmentDate date,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE set null,
    FOREIGN KEY (DoctorID) REFERENCES Doctors (DoctorID) ON DELETE set null
);

-- Creating MedicalRecords Table
CREATE TABLE MedicalRecords (
    RecordID int PRIMARY KEY,
    PatientID int,
    TreatmentID int,
    Notes text,
    RecordDate date,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE set null,
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID) ON DELETE set null
);

-- Creating Billing Table
CREATE TABLE Billing (
    BillID int PRIMARY KEY,
    PatientID int,
    TreatmentID int,
    Amount real,
    BillDate date,
    Status text CHECK (Status IN ('Paid', 'Unpaid')),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE set null,
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID) ON DELETE set null
);
