
USE medication_adherence;

CREATE TABLE patient_measure_cohort_window AS

SELECT
    c.patient_id,
    c.measure,
    c.counting_refills,
    c.distinct_drugs,

    p.enrolled_from,
    p.enrolled_through,

    -- First eligible counting refill
    MIN(DATE(e.filled_on)) AS measurement_start,

    -- Earlier of enrollment end and December 31, 2025
    LEAST(
        DATE('2025-12-31'),
        DATE(p.enrolled_through)
    ) AS measurement_end,

    -- Inclusive measurement period
    DATEDIFF(
        LEAST(
            DATE('2025-12-31'),
            DATE(p.enrolled_through)
        ),
        MIN(DATE(e.filled_on))
    ) + 1 AS measurement_days

FROM patient_measure_cohort AS c

INNER JOIN patients AS p
    ON c.patient_id = p.patient_id

INNER JOIN eligible_prescriptions AS e
    ON c.patient_id = e.patient_id
    AND c.measure = e.measure

GROUP BY
    c.patient_id,
    c.measure,
    c.counting_refills,
    c.distinct_drugs,
    p.enrolled_from,
    p.enrolled_through;
