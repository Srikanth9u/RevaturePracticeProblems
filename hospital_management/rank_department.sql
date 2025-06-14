-- Complete the query to rank Doctors by treatment count within each department
-- (Make use of CASE statement and PARTITION BY clause)

-- The output should contain the following fields: 
-- | Department | Doctor | TotalTreatments | RankWithinDepartment |

SELECT  
    CASE  
        WHEN d.Specialization = 'Cardiology' THEN 'Cardiology Department' 
        WHEN d.Specialization = 'Neurology' THEN 'Neurology Department'  
        ELSE 'Other Department'  
    END AS Department,  
    d.Name AS Doctor,  
    COUNT(t.TreatmentID) AS TotalTreatments,  
    RANK() OVER (PARTITION BY  
        CASE  
            WHEN d.Specialization = 'Cardiology' THEN 'Cardiology Department'  
            WHEN d.Specialization = 'Neurology' THEN 'Neurology Department'  
            ELSE 'Other Department'  
        END  
        ORDER BY COUNT(t.TreatmentID) DESC) AS RankWithinDepartment  
FROM Doctors d  
LEFT JOIN Treatments t ON d.DoctorID = t.DoctorID  
GROUP BY d.Specialization, d.Name, d.DoctorID  
ORDER BY Department, RankWithinDepartment;  
