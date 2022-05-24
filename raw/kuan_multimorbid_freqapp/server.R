library(shiny)
library(dplyr)
library(reshape2)
library(magrittr)
library(data.table)
library(DT)

load("tables_top50_triads.rda")

round2 = function(x, n) {
  posneg = sign(x)
  z = abs(x)*10^n
  z = z + 0.5 + sqrt(.Machine$double.eps)
  z = trunc(z)
  z = z/10^n
  z*posneg
}

function(input, output) {

table_top50_triad<-reactive({ 
if (input$dataset == "Whole") {whole_top50_triads}
else if  (input$dataset == "Asian") {asian_top50_triads}
else if  (input$dataset == "Black") {black_top50_triads}
else if  (input$dataset == "White") {white_top50_triads}
else if  (input$dataset == "Female") {female_top50_triads}
else if  (input$dataset == "Male") {male_top50_triads}
else if  (input$dataset == "Age 0-9+") {age_0_top50_triads}
else if  (input$dataset == "Age 10-19+") {age_10_top50_triads}
else if  (input$dataset == "Age 20-29+") {age_20_top50_triads}
else if  (input$dataset == "Age 30-39+") {age_30_top50_triads}
else if  (input$dataset == "Age 40-49+") {age_40_top50_triads}
else if  (input$dataset == "Age 50-59+") {age_50_top50_triads}
else if  (input$dataset == "Age 60-69+") {age_60_top50_triads}
else if  (input$dataset == "Age 70-79+") {age_70_top50_triads}
else if  (input$dataset == "Age 80+") {age_80_top50_triads}
 })


 observe({
output$dataTable <- DT::renderDT({
    datatable(table_top50_triad() %>% mutate(Prevalence=format(round2(Prevalence, 4),nsmall=4)) %>% mutate(LCI=format(round2(LCI, 4),nsmall=4)) %>% mutate(UCI=format(round2(UCI, 4),nsmall=4)) %>% select(c(`Disease Triad` = Triad ,`Prevalence (%)`= Prevalence, `Low Conf Int` = LCI, `Upp Conf Int` = UCI )),rownames=F) 
})
})

}


