
USE medication_adherence;

-- Prepare eligible refills within patient measurement windows

DROP TABLE IF EXISTS cohort_refills;

CREATE TABLE cohort_refills AS

SELECT
    e.fill_id,
    e.patient_id,
    e.measure,
    e.drug_name,
    DATE(e.filled_on) AS filled_on,
    e.days_supply,
    DATE(w.measurement_start) AS measurement_start,
    DATE(w.measurement_end) AS measurement_end,
    w.measurement_days

FROM eligible_prescriptions AS e

INNER JOIN patient_measure_cohort_window AS w
    ON e.patient_id = w.patient_id
    AND e.measure = w.measure

WHERE DATE(e.filled_on)
    BETWEEN DATE(w.measurement_start)
    AND DATE(w.measurement_end);
