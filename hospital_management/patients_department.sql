-- Complete the query to find patients treated in multiple departments (specializations)
-- (Use the concept of JOINS, Subqueries & Set Operations)

-- The output should contain the following fields: 
-- |PatientID | Name | Specialization

SELECT t.PatientID, p.Name, d.Specialization 
FROM Treatments t  
JOIN Patients p ON t.PatientID = p.PatientID  
JOIN Doctors d ON t.DoctorID = d.DoctorID  
WHERE t.PatientID IN (  
    SELECT t2.PatientID  
    FROM Treatments t2  
    JOIN Doctors d2 ON t2.DoctorID = d2.DoctorID  
    GROUP BY t2.PatientID  
    HAVING COUNT(DISTINCT d2.Specialization) > 1  
)  
ORDER BY t.PatientID , d.Specialization ;