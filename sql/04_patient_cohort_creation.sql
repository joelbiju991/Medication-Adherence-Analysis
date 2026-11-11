
USE medication_adherence;

-- Remove an earlier version if this step is being rerun
DROP TABLE IF EXISTS patient_measure_cohort;

-- Create patient cohorts by adherence measure

CREATE TABLE patient_measure_cohort AS

SELECT
    patient_id,
    measure,

    COUNT(*) AS counting_refills,

    COUNT(DISTINCT drug_name) AS distinct_drugs

FROM eligible_prescriptions

GROUP BY
    patient_id,
    measure

HAVING COUNT(*) >= 2;
