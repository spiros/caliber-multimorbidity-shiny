library(shiny)
library(dplyr)
library(reshape2)
library(magrittr)
library(data.table)
library(DT)

load("tables_top50_triads.rda")

fluidPage(

#  titlePanel(h1("Multimorbidity Frequency App", h3("50 most prevalent disease triads"))),
   
   titlePanel(h1("Multimorbidity Frequency App")),

  sidebarPanel(


    selectInput('dataset', 'Dataset', c("Whole", "Asian", "Black", "White", "Female", "Male", "Age 0-9+", "Age 10-19+", "Age 20-29+", "Age 30-39+", "Age 40-49+", "Age 50-59+", "Age 60-69+", "Age 70-79+", "Age 80+"), selected="Whole"), 

  ),



  mainPanel(
 h2("50 most prevalent disease triads"),
  
 dataTableOutput("dataTable")
     )
  )


