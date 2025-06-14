-- Write the query to fetch all Scheduled Consultations (Use the concept of JOINs)

-- The output should contain the following fields: 
-- | AppointmentID | Patient | Doctor | AppointmentDate |

select a.AppointmentID,p.name as Patient,d.name as Doctor,a.AppointmentDate from Doctors d inner join Appointments a on a.DoctorId=d.DoctorId 
    inner join Patients p on a.PatientID=p.PatientID 
    where a.Status ="Scheduled";