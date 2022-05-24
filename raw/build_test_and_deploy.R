library(shiny)
library(rsconnect)
library(reshape2)
library(igraph)
library(gplots)

rsconnect::setAccountInfo(name='pasea',
                          token='D0A8A763B9AF688316E4B9645732E069',
                          secret='91qqchgtnofkoiSMnJjCzR6Ga5nP0SfloWQcWltG')

setwd("/Users/spiros/projects/valerie-multimorbidity/raw/kuan_multimorbid_freqapp/")
#runApp()
deployApp()

setwd("/Users/spiros/projects/valerie-multimorbidity/raw//kuan_comorbid_networks/")
runApp()
deployApp()

setwd("/Users/spiros/projects/valerie-multimorbidity/raw/kuan_multimorbid_networks/")
runApp()
deployApp()

setwd("/Users/spiros/projects/valerie-multimorbidity/raw/kuan_comorbid_byfreq//")
runApp()
deployApp()
