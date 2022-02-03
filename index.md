---
layout: home
title: Multimorbidity and comorbidity networks from 4 million patients in the National Health Service
---


#### Background
Multimorbidity is a growing health challenge but there are limited data on common disease clusters, especially in ethnic minorities and younger people. We aimed to explore multimorbidity and comorbidity for all ages in a multi-ethnic population from two perspectives: non-random disease associations that could indicate shared risk factors or pathophysiology; and frequently occurring disease combinations that could inform recruitment of clinical trials, and hence direct clinical guidelines and management of the vast numbers of patients with multimorbidity.

#### Methods
We examined multimorbidity and comorbidity patterns stratified by ethnicity, sex, and age for 308 health conditions in 3,872,451 individuals using the Clinical Practice Research Datalink (CPRD) linked to the Hospital Episode Statistics admitted patient care (HES-APC) dataset in England. First, we used the partial correlation in network analysis to find conditions that co-occurred more often than expected by chance. Next, we identified the most prevalent combinations of conditions and comorbidities for index conditions. 

#### Findings
Multimorbidity increased with age. A higher proportion of boys under the age of ten (48%) had multimorbidity than girls (40%). Above the age of ten, more females in each decade of life were diagnosed with multimorbidity than males. White individuals (78.7%) were more likely to have multimorbidity compared to black (60.1%) or south-Asian individuals (60.2%).

Spinal fractures were most strongly associated with malignancy and infection in black individuals, but with osteoporosis in white individuals. Hypertension was most strongly associated with kidney disorders in those aged 20-29 years, but with dyslipidaemia, obesity, and diabetes in individuals above the age of 40 years. Breast cancer, asthma and bipolar affective disorder were strongly associated with different non-random comorbidities in different ethnic, sex and age subgroups respectively. This could be due to different pathogenic mechanisms, risk factors or treatments in the different subgroups. 

Depression commonly co-occurred with anxiety, migraine, obesity, atopic conditions, deafness, soft tissue disorders and gastrointestinal disorders. Except for anxiety and migraine, these conditions are not mentioned in NICE’s guidelines on depression. Coronary heart disease, valvular disease, cardiac arrhythmias, lung diseases, musculoskeletal diseases, hypertension, renal insufficiency, type 2 diabetes, and peripheral vascular disease were very common in patients with heart failure, yet heart failure trials often exclude patients with these conditions.

#### Interpretation
We have presented two perspectives of multimorbidity and comorbidity for a wide range of diseases stratified by ethnicity, sex, and age. Our online tools provide a resource for patients and their clinicians (to prevent, detect and treat comorbid conditions); research funders and policymakers (to redesign service provision, training priorities and guideline development); and biomedical researchers and manufacturers of medicines (to provide leads for research into common or sequential pathways of disease and inform the design of clinical trials). 


#### Interactive tools

We have created a series of interactive R Shiny apps to explore the underlying data and our findings. Information on the defined populations be downloaded from [here](/assets/Table_linkfiles.xlsx)

<div class="row">
    <div class="col-md-6">
        Multimorbidity networks of conditions that occur together more frequently than expected by chance can be explored <a href="https://pasea.shinyapps.io/kuan_multimorbid_networks">here</a>
    </div>
    <div class="col-md-6">
        <img src="/assets/img/whole_disease.png"/>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        Comorbidity networks of non-random associations can be interrogated for index conditions can be viewed <a href="https://pasea.shinyapps.io/kuan_comorbid_networks/">here</a>
    </div>
    <div class="col-md-6">
        <img src="/assets/img/comorb_network.png"/>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        The most common comorbidities for an index condition can be viewed <a href="https://pasea.shinyapps.io/kuan_comorbid_byfreq/">here</a>
    </div>
    <div class="col-md-6">
        <img src="/assets/img/most_common.png"/>
    </div>
</div>


#### Phenotyping algorithms

Human-friendly versions of disease EHR phenoypes can be browsed on the <a href="https://phenotypes.healthdatagateway.org/">HDR UK Phenotypes Library</a>.

Machine readable versions of the EHR phenotyping algorithms are available in our <a href="https://github.com/spiros/chronological-map-phenotypes">repository</a>. 

More details on the phenotyping apporach can be found in: Kuan V. et. al. Lancet Digit Health. 2019 May 20;1(2):e63-e77. <a href="https://pubmed.ncbi.nlm.nih.gov/31650125/">doi: 10.1016/S2589-7500(19)30012-3</a>