library(shiny)
library(dplyr)
library(reshape2)
library(magrittr)
library(ggplot2)
library(igraph)
library(gplots)
library(colorspace) 
library(RColorBrewer)
library(data.table)
library(DT)

load("node_every_2010.rda")
load("link_every_pcor_2010.rda")

fluidPage(

  titlePanel("Comorbidity Network App"),


  sidebarPanel(

    selectInput('ethnicity', 'Ethnicity', c("All Ethnicities", "Asian", "Black", "White"), selected="All Ethnicities"), 


    selectInput('sex', 'Sex', c("Both sexes", "Female", "Male"), selected="Both sexes"), 

    selectInput('age', 'Age', c("All ages", "Age 0-9+", "Age 10-19+", "Age 20-29+", "Age 30-39+", "Age 40-49+", "Age 50-59+", "Age 60-69+", "Age 70-79+", "Age 80+"), selected="All ages"), 


    selectInput('dz', 'Index Disease', sort(node_asian_whole_2010$Disease), selected="Macular Degeneration"), 

    numericInput('cocut', 'Partial Correlation cut-off', value=0.01, step=0.005),
    numericInput('pcut', 'P-value cut-off', value=0.0000010575743, min=0, max=1, step=0.001),

#    selectInput('layout', 'Layout',c("layout_as_star","layout_with_fr"), selected="layout_as_star"), 
	
    numericInput('height', 'Height', value=800, step=100),
    numericInput('width', 'Width', value=800, step=100),
 
#hr(),
tags$hr(style="border-color: black;"),
h5(strong("Legend")),
fluidRow(column(12, div(dataTableOutput("dataTable")))) 


  ),

  mainPanel(
     tabsetPanel(
        tabPanel("Network", plotOutput('netplot')),
        tabPanel("User guide",
        h5(strong("COMORBIDITY NETWORKS")),
        h5(p("Comorbidity networks display conditions that are more likely to co-occur with an index condition than expected by chance. Networks are by definition composed of nodes (also called points) and edges (also called links or lines). In this context, nodes represent health conditions and edges (the connections between nodes) represent the partial correlation quantifying the strength of association between health conditions. An edge is present between two nodes if the partial correlation is above a specified threshold. The width of the edge is proportional to the partial correlation between the health conditions. The size of a node is proportional to the period prevalence of the health condition between 1 April 2010 and 31 March 2015 in the sample population from which the network is drawn.")),
#        br(),        
        h5(p("The following provides a guide to the inputs from the selection panel:")),
		h5(strong("Ethnicity")),
        h5(p("Select to view the multimorbidity network for all ethnicities, Asian, Black or White subpopulations.")),
#        br(),  
		h5(strong("Sex")),
        h5(p("Select to view the multimorbidity network for both sexes, females only, or males only.")),
#        br(),  
		h5(strong("Age")),
        h5(p("Select to view the multimorbidity network for all ages, or by ten-year age groups.")),
		h5(strong("Index Disease")),
        h5(p("Select one of 308 conditions as the index disease that is to be the specific focus of attention. The comorbidity network will display the non-random disease associations of the chosen index disease with other conditions, indicating which comorbidities co-occur with the index condition more often than expected by chance.")),
#        br(),  
		h5(strong("Partial Correlation cut-off")),
        h5(p("Select the partial correlation cut-off above which the edges in the network are to be shown.")),
#        br(),
        h5(p("The partial correlation quantifies the strength of association between two health conditions. A partial correlation value greater than zero indicates that two conditions are more likely to have occurred in the same individual than expected by chance. Higher partial correlation values indicate stronger associations between conditions.")),
#        br(),
        h5(p("The selection of the partial correlation cut-off above which to display the edges of the network is subjective. A compromise is required between the number of connections shown in the network and the clarity with which these connections can be appreciated. As the partial correlation cut-off increases, the network displays fewer connections between disease pairs, and the edges that remain demonstrate the strongest associations between disease pairs. However, a network displaying edges above a high partial correlation cut-off would be sparse and uninformative, while one that shows all edges below a low partial correlation cut-off would be too dense to interpret. The following table provides the mean, standard deviation and percentiles for the partial correlations for each stratified subgroup to help the user decide on the appropriate partial correlation cut-off for their needs.")),
        HTML('<img src="https://i.ibb.co/hVvq77j/pcor-descrstats-wlab.png", height="300px"'),
#        h5("Table. Descriptive statistics of partial correlation values for subpopulation stratified by sex, ethnicity and age."),
        br(),
        h5(p("As a guide, the 90th percentile for the partial correlation in the whole population is 0.011, while the 99th percentile is 0.085. The default for the partial correlation cut-off has been set at 0.01. However, the partial correlation cut-off that allows meaningful interpretation may be different for different population sub-groups, or different index conditions, and the user can change the cut-off accordingly.")),
#        br(),  
		h5(strong("P-value cut-off")),
        h5(p("Select the partial correlation p-value cut-off above which the edges in the network are to be shown.")),
#        br(),
        h5(p(HTML(paste0("The default for the p-value of the partial correlation has been set at the Bonferroni-corrected level of 0.05/(308*307/2) = 1.06 x 10",tags$sup("-6"), " for 47,278 pairs of health conditions. Users can select more or less conservative levels of p-value as they deem appropriate.")))),
#        br(),
		h5(strong("Height and Width")),
        h5(p("These parameters determine the size of the network. Different devices may display the networks differently. These parameters allow the size of the networks to be adjusted for optimal viewing on the user’s device.")),


        )
     )
  )
)

