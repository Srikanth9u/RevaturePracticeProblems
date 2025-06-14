-- Write the query to count the patients with specific conditions.
-- (Use the concept of Aggregations & Analytical Functions)

-- The output should contain the following fields: 
-- |Diagnosis  | PatientCount
select Diagnosis,count(Diagnosis) as PatientCount from Treatments group by Diagnosis;