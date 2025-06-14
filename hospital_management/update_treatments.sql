-- Write all the queries here & SUBMIT them all at once.
-- Step 1: Write the query to alter the Treatments Table to include a column called 'FeedbackScore'

alter Table Treatments add column FeedbackScore int check (FeedbackScore Between 1 AND 5);
-- Step 2: Write the queries to update the Treatments Table by inserting the new FeedbackScore values
update Treatments set FeedbackScore=5 where TreatmentID=1;
Update Treatments set FeedbackScore=4 where TreatmentID=2;
Update Treatments set FeedbackScore=3 where TreatmentID=3;

-- Step 3: Write the query to fetch and display all the records from the Treatments Table

select * from Treatments;