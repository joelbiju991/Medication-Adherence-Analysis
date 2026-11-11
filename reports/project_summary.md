# Medication Adherence Analysis
## CVS Health — Healthcare Analytics Project

### Project Objective

Measured medication adherence across diabetes, hypertension RAS,
and cholesterol statins using prescription refill records from 2025.

The main objective was to calculate Proportion of Days Covered (PDC),
identify patients below the 80% adherence threshold, and identify
patients who could potentially benefit from pharmacy outreach.

### Data Preparation

- Drug reference records: 14
- Patient records: 2,200
- Original prescription records: 25,279
- Exact duplicate prescription records removed: 18
- Standardized prescription drug names: 42 variations reduced to 14
- Drug-reference matching: 100%
- Eligible counting refills: 24,700
- Eligible patient-measure groups: 3,565
- Unique eligible patients: 2,181

Counting refills were defined as filled prescriptions with
positive days supply. Reversed prescriptions and filled records
with zero days supply were excluded from coverage calculations.

### Adherence Results

| Measure | Eligible Groups | Adherent | Non-Adherent | Adherence Rate |
|---|---:|---:|---:|---:|
| Cholesterol Statins | 1166 | 910 | 256 | 78.04% |
| Diabetes | 1207 | 927 | 280 | 76.80% |
| Hypertension RAS | 1192 | 931 | 261 | 78.10% |

Diabetes had the lowest adherence rate at 76.80%.

### Outreach Analysis

September 30, 2025, was used as an assumed outreach
assessment date because the scenario did not specify one.

- Active patient-measure groups: 3,443
- Groups below 80% at the assessment date: 643
- Groups theoretically able to reach 80%: 106
- Unique patients identified for outreach: 100

The outreach assessment used prescription information available
on or before September 30, 2025.

Maximum achievable PDC represents a theoretical ceiling,
not a prediction of future patient behaviour.

### Pharmacy Channel Comparison

| Channel | Patient-Measure Groups | Average PDC | Adherence Rate |
|---|---:|---:|---:|
| Mail Order | 1093 | 93.96% | 83.44% |
| Retail | 2472 | 85.36% | 75.08% |

Mail-order groups had an adherence rate 8.36 percentage
points higher than retail groups.

Channel classification was based on the greater total
days supply across the two pharmacy channels.

### Copay Analysis

Average copays were normalized to a 30-day supply.

- Pearson correlation: -0.2120
- Spearman correlation: -0.2531
- Lowest copay quartile adherence: 83.74%
- Highest copay quartile adherence: 74.86%

The results suggest a weak negative association between
copay amounts and medication adherence.

This is an observational analysis and does not establish
a causal relationship.

### Recommendations

1. Prioritize diabetes adherence for further investigation.
2. Consider targeted outreach for the 100 patients identified.
3. Investigate whether mail-order pharmacy access can be
   expanded to eligible retail patients.
4. Explore affordability support for patients with higher copays.
5. Continue monitoring adherence across all three measures.

### Tools Used

Python, Pandas, NumPy, MySQL, SQLAlchemy, Jupyter Notebook,
Matplotlib and Seaborn.

### Final Deliverables

- patient_adherence.csv
- adherence_summary.csv
- outreach_list.csv
