---
layout: phenotype
title: PHE00335 - Asthma
phenotype_id: PHE00335
name: Asthma
type: Disease or Syndrome
group: Respiratory
data_sources: 
    - UK Biobank
    - primary care
    - hospital admissions data
    - mortality data
clinical_terminologies: Read, SNOMED CT, ICD-10
validation: cross-source, casenote, aetiology, prognosis
primary_care_code_lists: 
secondary_care_code_lists: 
valid_event_data_range: 01/01/2001 to 31/12/2019
sex: Female/Male
contact_author: Quint J. K.
author: Eleanor L Axson, Jennifer K Quint
status: FINAL
date: 2019-12-16
modified_date: 2019-12-16
version: Revision 1
PMID: 30662273
country: UK
---

## Definitions

### UK Biobank

In Biobank, we utilised the self-report codes per the Definitions of Asthma for UK Biobank Phase 1 Outcomes Adjudication. You can find more information here: http://biobank.ndph.ox.ac.uk/showcase/showcase/docs/alg_outcome_asthma.pdf		
		
{% include csv.html csvdata=site.data.quint-asthma-ukb %}

### Primary Care

{% include csv.html csvdata=site.data.quint-asthma-cprd %}

### Secondary Care

{% include csv.html csvdata=site.data.quint-asthma-hes %}

### Death

In the Office for National Statistics (ONS) mortality register, we used ICD-10 terms to identify where asthma was recorded as the underlying cause of death.

{% include csv.html csvdata=site.data.quint-asthma-ons %}

### Implementation

These codes will capture asthma ever, not just current asthma. These codes are not intended to be mandatory, but are to be used as a starting point for the identification of asthma in routine EHR. Each study may differ in the sensitivity and specificity of the coding required. 

For those interested in further discrimination of asthma phenotypes, we refer you to Nissen et al. 2019.

F. Nissen, Douglas, I. J., Mullerova, H., Pearce, N., Bloom, C. I., Smeeth, L., and Quint, J. K., “Clinical profile of predefined asthma phenotypes in a large cohort of UK primary care patients (Clinical Practice Research Datalink)”, J Asthma Allergy, vol. 12, pp. 7-19, 2019.

### Validations

Al Sallakh et al. and Nissen et al. both reviewed the literature for the validation of asthma in EHR in 2017. They found that high PPV were possible using a variaty of methods; however, there was high heterogeneity in the methods used.

* F. Nissen, Quint, J. K., Wilkinson, S., Mullerova, H., Smeeth, L., Douglas, I. J., "Validation of Asthma Recording in Electronic Health Records: A Systematic Review", Clinical Epidemiology, vol. 9, p. 643-656, 2017.

* F. Nissen, Quint, J. K., Wilkinson, S., Mullerova, H., Smeeth, L., Douglas, I. J., "Validation of Asthma Recording in Electronic Health Records: Protocol for a Systematic Review ", BMJ Open, vol. 7, p. e014694, 2017.

* M. A. Al Sallakh, Vadileiou E., Rodgers, S. E., Lyons, R. A., Sheikh, A., Davies, G. A., "Defining asthma and assessing asthma outcomes using electronic health record data: a systematic scoping review", Eur Respir J, vol. 49, p. 1700204, 2017.

### Publications

#### Publications from 2019 using validated Read codes from Nissen et al. 2017

* F. Nissen, Douglas, I. J., Mullerova, H., Pearce, N., Bloom, C. I., Smeeth, L., and Quint, J. K., “Clinical profile of predefined asthma phenotypes in a large cohort of UK primary care patients (Clinical Practice Research Datalink)”, J Asthma Allergy, vol. 12, pp. 7-19, 2019.

* C. I. Bloom, Walker, S., and Quint, J. K., “Inadequate specialist care referrals for high-risk asthma patients in the UK: an adult population-based cohort 2006-2017”, J Asthma, pp. 1-7, 2019.

* D. Dedman, Coton, S. J., Ghosh, R. E., Meeraus, W., Crim, C., Harvey, C., Amelio, J., and Landis, S. H., “Treatment Patterns of New Users of Fluticasone Furoate/Vilanterol in Asthma and COPD in UK Primary Care: Retrospective Cohort Study”, Pulmonary Therapy, vol. 5, pp. 81-95, 2019.

#### Publications from 2019 using Read codes from QOF

* P. Rockenschaub, Jhass, A., Freemantle, N., Aryee, A., Rafiq, M., Hayward, A., and Shallcross, L., “Opportunities to reduce antibiotic prescribing for patients with COPD in primary care: a cohort study using electronic health records from the Clinical Practice Research Datalink (CPRD)”, J Antimicrob Chemother, 2019.