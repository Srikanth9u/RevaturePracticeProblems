-- Write the query to Get all Doctors from Cardiology Specialization With Scheduled Appointments 
-- (Use the concept of JOINs)

-- The output should contain the following fields: 
-- | Name |

select d.name from Doctors d inner join Appointments a on a.DoctorId=d.DoctorId 
    where a.Status ="Scheduled" and d.Specialization="Cardiology";