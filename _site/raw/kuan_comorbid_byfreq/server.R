library(shiny)
library(plyr)
library(dplyr)
library(reshape2)
library(magrittr)
library(ggplot2)
library(data.table)
library(DT)

load("ct_prev_prop_cat_labels.rda")


cat_names<-c("Infections", "Cancers", "Benign Neo", "Haem/Imm", "Endocrine", "Psychiatric", "Neurological", "Eye", "Ear", "Cardiovascular", "Respiratory", "Digestive", "Skin", "Musculoskeletal", "Genitourinary", "Perinatal")

colourstouse<- c("Infections"="#FFF68F", "Cancers"="#006400", "Benign Neo"="#AB82FF", "Haem/Imm"="#7FFF00", "Endocrine"="#53868B", "Psychiatric"="#8B2500", "Neurological"="#FFEFDB", "Eye"="#6495ED", "Ear"="#00FFFF", "Cardiovascular"="#00008B", "Respiratory"="#FF7F00", "Digestive"="#CAE1FF", "Skin"="#FF4040", "Musculoskeletal"="#FFB90F", "Genitourinary"="#838B8B", "Perinatal"="#0000FF")

round2 = function(x, n) {
  posneg = sign(x)
  z = abs(x)*10^n
  z = z + 0.5 + sqrt(.Machine$double.eps)
  z = trunc(z)
  z = z/10^n
  z*posneg
}

function(input, output) {

inputdz<-reactive({rownames(labels[labels$Disease==input$dz,]) })


ct_prev_prop_cat<-reactive({ 
if (input$dataset == "Whole") {ct_prev_prop_cat_whole}
else if  (input$dataset == "Asian") {ct_prev_prop_cat_asian}
else if  (input$dataset == "Black") {ct_prev_prop_cat_black}
else if  (input$dataset == "White") {ct_prev_prop_cat_white}
else if  (input$dataset == "Female") {ct_prev_prop_cat_female}
else if  (input$dataset == "Male") {ct_prev_prop_cat_male}
else if  (input$dataset == "Age 0-9+") {ct_prev_prop_cat_age_0}
else if  (input$dataset == "Age 10-19+") {ct_prev_prop_cat_age_10}
else if  (input$dataset == "Age 20-29+") {ct_prev_prop_cat_age_20}
else if  (input$dataset == "Age 30-39+") {ct_prev_prop_cat_age_30}
else if  (input$dataset == "Age 40-49+") {ct_prev_prop_cat_age_40}
else if  (input$dataset == "Age 50-59+") {ct_prev_prop_cat_age_50}
else if  (input$dataset == "Age 60-69+") {ct_prev_prop_cat_age_60}
else if  (input$dataset == "Age 70-79+") {ct_prev_prop_cat_age_70}
else if  (input$dataset == "Age 80+") {ct_prev_prop_cat_age_80}
 })


### create seldz_prev df as input to ggplot
seldz_prev <- reactive({

selprev1 <- ct_prev_prop_cat() %>% filter(Var1==inputdz()) %>% filter(Var2!=inputdz()) %>% arrange(desc(Proportion)) %>% slice(1:50) %>% filter(Count > 100) %>% select(c(Disease,Category,Proportion)) %>% arrange(Category, -Proportion) #

selprev1$Category <- as.factor(selprev1$Category)

empty_bar=2
first_empty=6

to_add_seldz  <- data.frame(matrix(NA, empty_bar*nlevels(selprev1$Category), ncol(selprev1)) )
colnames(to_add_seldz) = colnames(selprev1)
to_add_seldz$Category = rep(levels(selprev1$Category), each=empty_bar)

to_add_end <- data.frame( matrix(NA, first_empty, ncol(selprev1)) )
colnames(to_add_end) = colnames(selprev1)
to_add_end$Category=rep("Perinatal", each=first_empty)

seldzprev2  <- rbind(selprev1, to_add_seldz, to_add_end)  

seldz_prev_plot <- seldzprev2 %>% mutate(Category=factor(Category,levels=cat_names)) %>% arrange(Category)
seldz_prev_plot$id=seq(1, nrow(seldz_prev_plot))

seldz_prev_plot
})


 
# Get the name and the y position of each label
label_seldz <- reactive({ 

labseldz <- seldz_prev()  

number_of_bar <- nrow(labseldz)

angle <- 90 - 360 * (labseldz$id-0.5) /number_of_bar   # substract 0.5 so the letter has the angle of the center of the bars. Not extreme right(1) or extreme left (0)

labseldz$hjust<-ifelse( angle< -90, 1.1, -0.1)
labseldz$angle<-ifelse(angle < -90, angle +180, angle)

labseldz
})

#################################

###prepare axis limits and ticks
max_seldzprev <-  reactive({ max(seldz_prev()$Proportion, na.rm=T) })

ylim_max <-  reactive({  
#if (max_seldzprev() > 0.8) {
#	1
#} else if (max_seldzprev() > 0.5 & max_seldzprev() <= 1){
#	round_any(max_seldzprev(), 0.1, ceiling)
#} else if (max_seldzprev() > 0.1 & max_seldzprev() <= 0.5){
#    round_any(max_seldzprev(), 0.1, ceiling)
#} else {
    round_any(max_seldzprev(), 0.1, ceiling)
#}
})

num_yaxis_ticks <- reactive({  
if (max_seldzprev() > 0.4) {
	ylim_max()/0.1
} else if (max_seldzprev() > 0.1 & max_seldzprev() <= 0.4){
	ylim_max()/0.05
#} else if (max_seldzprev() > 10 & max_seldzprev() <= 200){
#	ylim_max()/20
} else {
	ylim_max()/0.01
}	
})

yaxis_ticks <- reactive({  
if (max_seldzprev() > 0.4) {
	seq(0.1, ylim_max(), 0.1)
} else if (max_seldzprev() > 0.1 & max_seldzprev() <= 0.4){
	seq(0.05, ylim_max(), 0.05)
#} else if (max_seldzprev() > 10 & max_seldzprev() <= 200){
#	seq(20, ylim_max(), 20)
} else {
	seq(0.01, ylim_max(), 0.01)
}
})

yaxis_ticklabs <- reactive({  
if (max_seldzprev() > 0.4) {
	paste0(seq(0.1, ylim_max(), 0.1),"")
} else if (max_seldzprev() > 0.1 & max_seldzprev() <= 0.4){
	paste0(seq(0.05, ylim_max(), 0.05),"")
#} else if (max_seldzprev() > 10 & max_seldzprev() <= 200){
#	paste0(seq(0.2, ylim_max()/100, 0.2),"")
} else {
	paste0(seq(0.01, ylim_max(), 0.01),"")
}
})

#label_dist <- reactive({  
#if (max_seldzprev() > 1000) {
#	15
#} else if (max_seldzprev() > 200 & max_seldzprev() <= 1000){
#	8
#} else if (max_seldzprev() > 10 & max_seldzprev() <= 200){
#	1.5
#} else {
#	0.0001
#}
#})
#############################################
################# Make the plot
#############################################

  observe({

output$plot <- renderPlot({

  validate( need(seldz_prev()!= "", "Sorry, there are no comorbidities for your requested criteria. Please change your input selections."))

ggplot(seldz_prev(), aes(x=as.factor(id), y=Proportion, fill=Category)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  geom_bar(aes(x=as.factor(id), y=Proportion, fill=Category),stat="identity") + 
  ggtitle("Proportion of people with the index disease who also have the most common comorbidities") +  
  ylim(-ylim_max()/2,ylim_max()) +
  scale_fill_manual(name="Disease\nCategory",labels=cat_names, values=colourstouse, drop=F ) +  ## drop=F keeps the legend as provided, even if there are no values for some labels
  theme_minimal() +
  theme(
#    legend.position = "none",
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.title = element_text(face = "bold", size = 13, hjust=0.5, vjust=-0.5),
    plot.margin = unit(c(-0.5,-0.2,-0.5,-0.7), "cm") 
  ) +
  coord_polar() + 

geom_hline(yintercept=yaxis_ticks(), colour="white", size=0.75) +

  # Add text showing the value of each 100/75/50/25 lines
  annotate("text", x = rep(max(seldz_prev()$id),num_yaxis_ticks()), y = yaxis_ticks(), label = yaxis_ticklabs() , color="grey", size=3.5, angle=0, fontface="bold", hjust=1) +

  geom_text(data=label_seldz(), aes(x=id, y=Proportion-0.001, label=Disease, hjust=hjust), color="black",size=3.5, angle= label_seldz()$angle, inherit.aes = FALSE )



  } , height=900, width = 900)


})


#output$txt <- renderUI({
#                HTML("* <b>Maximum of 50 comorbidities with comorbid prevalence counts > 100 displayed<b>")
#})


#### make datatable
 observe({
output$dataTable <- DT::renderDT({
    datatable(ct_prev_prop_cat() %>% filter(Var1==inputdz()) %>% arrange(desc(Proportion)) %>% slice(2:51) %>% filter(Count > 100) %>% mutate(Prevalence=format(round2(Prevalence/100, 6),nsmall=6)) %>% mutate(Proportion=format(round2(Proportion, 2), nsmall=2)) %>%   select(c(Disease,Category,`Proportion*` = Proportion, `Prevalence (%)**`= Prevalence)),rownames=F) 
})
})

            output$txt1 <- renderUI({
                HTML("* <em>The proportion of people with the index disease who also have the following comorbidities<em>") 
})

            output$txt2 <- renderUI({
                HTML("** <em>The prevalence of the index disease with the following comorbidities<em>")
})
}





















