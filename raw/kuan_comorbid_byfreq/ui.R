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

load("ct_prev_prop_cat_labels.rda")

sidebarPanel2 <- function (..., out = NULL, width = 4) 
{
  div(class = paste0("col-sm-", width), 
    tags$form(class = "well", ...),
    out
  )
}


fluidPage(

  titlePanel("Most Common Comorbidities"),


  sidebarPanel2(

#    selectInput('ethnicity', 'Ethnicity', c("All Ethnicities", "Asian", "Black", "White"), selected="All Ethnicities"), 


#    selectInput('sex', 'Sex', c("Both sexes", "Female", "Male"), selected="Both sexes"), 

#    selectInput('age', 'Age', c("All ages", "Age 0-9+", "Age 10-19+", "Age 20-29+", "Age 30-39+", "Age 40-49+", "Age 50-59+", "Age 60-69+", "Age 70-79+", "Age 80+"), selected="All ages"), 


    selectInput('dz', 'Index Disease', sort(labels$Disease), selected="Macular Degeneration"), 

    selectInput('dataset', 'Dataset', c("Whole", "Asian", "Black", "White", "Female", "Male", "Age 0-9+", "Age 10-19+", "Age 20-29+", "Age 30-39+", "Age 40-49+", "Age 50-59+", "Age 60-69+", "Age 70-79+", "Age 80+"), selected="Whole"), 

#	out = h4("Prevalence (%) of index disease with the most common comorbidities"),

	out = h5("Comorbidities with comorbid prevalence counts > 100 displayed (maximum 50 comorbidities)")

  ),



  mainPanel(
#   plotOutput('plot')
     tabsetPanel(
        tabPanel("Plot", plotOutput("plot")), 
        tabPanel("Table", dataTableOutput("dataTable"), htmlOutput("txt1"), htmlOutput("txt2"))
     )
  )
)

