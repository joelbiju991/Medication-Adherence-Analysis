
USE medication_adherence;

-- Create a separate table for eligible prescription refills

CREATE TABLE eligible_prescriptions AS

SELECT *
FROM prescription_fills_with_measure

WHERE fill_status = 'filled'
  AND days_supply > 0;
