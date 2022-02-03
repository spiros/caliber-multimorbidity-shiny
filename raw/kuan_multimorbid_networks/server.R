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


owncol=c("#AB82FF", "#838B8B" ,"#0000FF" ,"#CAE1FF", "#00008B" ,"#00FFFF", "#53868B","#6495ED", "#7FFF00",   "#006400",  "#FFF68F","#FFB90F", "#FFEFDB" , "#FF7F00", "#8B2500", "#FF4040")

function(input, output) {

link_2010 <- reactive({ 
if (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age == "All ages") {link_alleth_whole_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age == "Age 0-9+") {link_alleth_whole_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {link_alleth_whole_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {link_alleth_whole_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {link_alleth_whole_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {link_alleth_whole_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {link_alleth_whole_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {link_alleth_whole_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {link_alleth_whole_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 80+") {link_alleth_whole_age_80_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age == "All ages") {link_alleth_female_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age == "Age 0-9+") {link_alleth_female_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 10-19+") {link_alleth_female_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 20-29+") {link_alleth_female_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 30-39+") {link_alleth_female_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 40-49+") {link_alleth_female_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 50-59+") {link_alleth_female_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 60-69+") {link_alleth_female_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 70-79+") {link_alleth_female_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 80+") {link_alleth_female_age_80_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age == "All ages") {link_alleth_male_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age == "Age 0-9+") {link_alleth_male_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 10-19+") {link_alleth_male_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 20-29+") {link_alleth_male_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 30-39+") {link_alleth_male_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 40-49+") {link_alleth_male_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 50-59+") {link_alleth_male_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 60-69+") {link_alleth_male_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 70-79+") {link_alleth_male_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 80+") {link_alleth_male_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age == "All ages") {link_asian_whole_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age == "Age 0-9+") {link_asian_whole_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {link_asian_whole_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {link_asian_whole_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {link_asian_whole_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {link_asian_whole_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {link_asian_whole_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {link_asian_whole_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {link_asian_whole_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 80+") {link_asian_whole_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age == "All ages") {link_asian_female_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age == "Age 0-9+") {link_asian_female_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 10-19+") {link_asian_female_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 20-29+") {link_asian_female_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 30-39+") {link_asian_female_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 40-49+") {link_asian_female_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 50-59+") {link_asian_female_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 60-69+") {link_asian_female_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 70-79+") {link_asian_female_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 80+") {link_asian_female_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age == "All ages") {link_asian_male_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age == "Age 0-9+") {link_asian_male_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 10-19+") {link_asian_male_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 20-29+") {link_asian_male_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 30-39+") {link_asian_male_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 40-49+") {link_asian_male_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 50-59+") {link_asian_male_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 60-69+") {link_asian_male_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 70-79+") {link_asian_male_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 80+") {link_asian_male_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age == "All ages") {link_black_whole_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age == "Age 0-9+") {link_black_whole_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {link_black_whole_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {link_black_whole_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {link_black_whole_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {link_black_whole_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {link_black_whole_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {link_black_whole_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {link_black_whole_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 80+") {link_black_whole_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age == "All ages") {link_black_female_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age == "Age 0-9+") {link_black_female_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 10-19+") {link_black_female_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 20-29+") {link_black_female_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 30-39+") {link_black_female_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 40-49+") {link_black_female_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 50-59+") {link_black_female_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 60-69+") {link_black_female_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 70-79+") {link_black_female_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 80+") {link_black_female_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age == "All ages") {link_black_male_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age == "Age 0-9+") {link_black_male_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 10-19+") {link_black_male_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 20-29+") {link_black_male_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 30-39+") {link_black_male_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 40-49+") {link_black_male_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 50-59+") {link_black_male_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 60-69+") {link_black_male_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 70-79+") {link_black_male_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 80+") {link_black_male_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age == "All ages") {link_white_whole_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age == "Age 0-9+") {link_white_whole_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {link_white_whole_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {link_white_whole_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {link_white_whole_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {link_white_whole_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {link_white_whole_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {link_white_whole_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {link_white_whole_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 80+") {link_white_whole_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age == "All ages") {link_white_female_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age == "Age 0-9+") {link_white_female_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 10-19+") {link_white_female_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 20-29+") {link_white_female_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 30-39+") {link_white_female_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 40-49+") {link_white_female_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 50-59+") {link_white_female_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 60-69+") {link_white_female_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 70-79+") {link_white_female_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 80+") {link_white_female_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age == "All ages") {link_white_male_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age == "Age 0-9+") {link_white_male_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 10-19+") {link_white_male_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 20-29+") {link_white_male_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 30-39+") {link_white_male_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 40-49+") {link_white_male_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 50-59+") {link_white_male_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 60-69+") {link_white_male_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 70-79+") {link_white_male_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 80+") {link_white_male_age_80_2010}
 })


node_2010<-reactive({ 
 if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age == "All ages") {node_alleth_whole_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age == "Age 0-9+") {node_alleth_whole_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {node_alleth_whole_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {node_alleth_whole_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {node_alleth_whole_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {node_alleth_whole_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {node_alleth_whole_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {node_alleth_whole_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {node_alleth_whole_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Both sexes" & input$age ==  "Age 80+") {node_alleth_whole_age_80_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age == "All ages") {node_alleth_female_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age == "Age 0-9+") {node_alleth_female_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 10-19+") {node_alleth_female_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 20-29+") {node_alleth_female_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 30-39+") {node_alleth_female_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 40-49+") {node_alleth_female_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 50-59+") {node_alleth_female_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 60-69+") {node_alleth_female_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 70-79+") {node_alleth_female_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Female" & input$age ==  "Age 80+") {node_alleth_female_age_80_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age == "All ages") {node_alleth_male_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age == "Age 0-9+") {node_alleth_male_age_0_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 10-19+") {node_alleth_male_age_10_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 20-29+") {node_alleth_male_age_20_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 30-39+") {node_alleth_male_age_30_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 40-49+") {node_alleth_male_age_40_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 50-59+") {node_alleth_male_age_50_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 60-69+") {node_alleth_male_age_60_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 70-79+") {node_alleth_male_age_70_2010}
else if  (input$ethnicity == "All Ethnicities" & input$sex == "Male" & input$age ==  "Age 80+") {node_alleth_male_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age == "All ages") {node_asian_whole_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age == "Age 0-9+") {node_asian_whole_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {node_asian_whole_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {node_asian_whole_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {node_asian_whole_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {node_asian_whole_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {node_asian_whole_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {node_asian_whole_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {node_asian_whole_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Both sexes" & input$age ==  "Age 80+") {node_asian_whole_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age == "All ages") {node_asian_female_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age == "Age 0-9+") {node_asian_female_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 10-19+") {node_asian_female_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 20-29+") {node_asian_female_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 30-39+") {node_asian_female_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 40-49+") {node_asian_female_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 50-59+") {node_asian_female_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 60-69+") {node_asian_female_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 70-79+") {node_asian_female_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Female" & input$age ==  "Age 80+") {node_asian_female_age_80_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age == "All ages") {node_asian_male_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age == "Age 0-9+") {node_asian_male_age_0_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 10-19+") {node_asian_male_age_10_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 20-29+") {node_asian_male_age_20_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 30-39+") {node_asian_male_age_30_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 40-49+") {node_asian_male_age_40_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 50-59+") {node_asian_male_age_50_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 60-69+") {node_asian_male_age_60_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 70-79+") {node_asian_male_age_70_2010}
else if  (input$ethnicity == "Asian" & input$sex == "Male" & input$age ==  "Age 80+") {node_asian_male_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age == "All ages") {node_black_whole_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age == "Age 0-9+") {node_black_whole_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {node_black_whole_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {node_black_whole_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {node_black_whole_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {node_black_whole_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {node_black_whole_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {node_black_whole_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {node_black_whole_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Both sexes" & input$age ==  "Age 80+") {node_black_whole_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age == "All ages") {node_black_female_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age == "Age 0-9+") {node_black_female_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 10-19+") {node_black_female_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 20-29+") {node_black_female_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 30-39+") {node_black_female_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 40-49+") {node_black_female_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 50-59+") {node_black_female_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 60-69+") {node_black_female_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 70-79+") {node_black_female_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Female" & input$age ==  "Age 80+") {node_black_female_age_80_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age == "All ages") {node_black_male_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age == "Age 0-9+") {node_black_male_age_0_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 10-19+") {node_black_male_age_10_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 20-29+") {node_black_male_age_20_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 30-39+") {node_black_male_age_30_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 40-49+") {node_black_male_age_40_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 50-59+") {node_black_male_age_50_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 60-69+") {node_black_male_age_60_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 70-79+") {node_black_male_age_70_2010}
else if  (input$ethnicity == "Black" & input$sex == "Male" & input$age ==  "Age 80+") {node_black_male_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age == "All ages") {node_white_whole_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age == "Age 0-9+") {node_white_whole_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 10-19+") {node_white_whole_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 20-29+") {node_white_whole_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 30-39+") {node_white_whole_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 40-49+") {node_white_whole_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 50-59+") {node_white_whole_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 60-69+") {node_white_whole_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 70-79+") {node_white_whole_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Both sexes" & input$age ==  "Age 80+") {node_white_whole_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age == "All ages") {node_white_female_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age == "Age 0-9+") {node_white_female_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 10-19+") {node_white_female_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 20-29+") {node_white_female_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 30-39+") {node_white_female_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 40-49+") {node_white_female_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 50-59+") {node_white_female_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 60-69+") {node_white_female_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 70-79+") {node_white_female_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Female" & input$age ==  "Age 80+") {node_white_female_age_80_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age == "All ages") {node_white_male_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age == "Age 0-9+") {node_white_male_age_0_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 10-19+") {node_white_male_age_10_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 20-29+") {node_white_male_age_20_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 30-39+") {node_white_male_age_30_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 40-49+") {node_white_male_age_40_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 50-59+") {node_white_male_age_50_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 60-69+") {node_white_male_age_60_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 70-79+") {node_white_male_age_70_2010}
else if  (input$ethnicity == "White" & input$sex == "Male" & input$age ==  "Age 80+") {node_white_male_age_80_2010}
 })

linked.dz<-reactive({
unique(as.vector(as.matrix(select(filter(link_2010(),partialcor.pval<input$pcut) %>% filter(partialcor>input$cocut), DzA:DzB))))
  })


dz.link<-reactive({
filter(link_2010(),partialcor.pval<input$pcut) %>% filter(partialcor>input$cocut)
  })

dz.node<-reactive({
node_2010()[linked.dz(),]
  })

dz.net<-reactive({
graph_from_data_frame(d=dz.link(), vertices=dz.node(), directed=F)
  })

  observe({
output$netplot <- renderPlot({
set.seed(123)
#par(xpd = T, mar =c(5, 4, 4, 2) + c(0,0,0,10)) ## for adding the legend but it makes the network look small, so better to have the legend separately
plot(dz.net(),  vertex.label.color="black", vertex.label.cex=1.1, vertex.label.dist=.8, vertex.label.degree=pi/2, vertex.size=(V(dz.net())$prev.rate)^0.3, vertex.color=V(dz.net())$Colour, rescale=T, edge.width=(E(dz.net())$partialcor)*20, layout=layout_nicely(dz.net()))
 } , height=input$height, width = input$width)
})

}



