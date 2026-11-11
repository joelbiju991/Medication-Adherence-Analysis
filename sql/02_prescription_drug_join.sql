
-- Select our project database
USE medication_adherence;

-- Create a joined table without modifying source tables

CREATE TABLE prescription_fills_with_measure AS

SELECT
    f.fill_id,
    f.patient_id,
    f.filled_on,
    f.drug_name,
    f.days_supply,
    f.quantity,
    f.pharmacy_id,
    f.copay_usd,
    f.fill_channel,
    f.fill_status,

    d.drug_class,
    d.measure,
    d.is_generic

FROM prescription_fills AS f

INNER JOIN drug_reference AS d

    ON f.drug_name = d.drug_name;
