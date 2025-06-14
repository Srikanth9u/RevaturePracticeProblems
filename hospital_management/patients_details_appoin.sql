-- Write the query to Get All Patients Including Those Without Appointments (Use the concept of JOINs)

-- The output should contain the following fields: 
-- | Name | AppointmentID | Status |
select p.name,a.AppointmentID,a.status from  Appointments a  
    inner join Patients p on a.PatientID=p.PatientID;