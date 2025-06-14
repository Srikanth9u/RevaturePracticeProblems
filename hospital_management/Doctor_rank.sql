-- Write the query to rank doctors based on patient feedback
-- (Use the concept of Aggregations & Analytical Functions)

-- The output should contain the following fields: 
-- | DoctorID  | Name | Rank
select d.DoctorID,d.name,Row_Number() over (order by AVG(t.FeedbackScore) DESC) as Rank from Doctors d inner join Treatments t on d.DoctorID=t.DoctorID group by d.name;