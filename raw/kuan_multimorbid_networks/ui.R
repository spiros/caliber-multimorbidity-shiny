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

  titlePanel("Whole Disease Network"),


  sidebarPanel(

    selectInput('ethnicity', 'Ethnicity', c("All Ethnicities", "Asian", "Black", "White"), selected="All Ethnicities"), 


    selectInput('sex', 'Sex', c("Both sexes", "Female", "Male"), selected="Both sexes"), 

    selectInput('age', 'Age', c("All ages", "Age 0-9+", "Age 10-19+", "Age 20-29+", "Age 30-39+", "Age 40-49+", "Age 50-59+", "Age 60-69+", "Age 70-79+", "Age 80+"), selected="All ages"), 


#    selectInput('dz', 'Index Disease', sort(node_asian_whole_2010$Disease), selected="Macular Degeneration"), 


    numericInput('pcut', 'P-value cut-off', value=0.0000010575743, min=0, max=1, step=0.001),

    numericInput('cocut', 'Partial Correlation cut-off', value=0.01, step=0.005),
#    selectInput('layout', 'Layout',c("layout_as_star","layout_with_fr"), selected="layout_as_star"), 
	
    numericInput('height', 'Height', value=1200, step=100),
    numericInput('width', 'Width', value=1200, step=100),
 
#hr(),
#tags$hr(style="border-color: black;"),
#h5(strong("Legend")),
#fluidRow(column(12, div(dataTableOutput("dataTable")))) 


  ),

  mainPanel(
   plotOutput('netplot')


  )
)

