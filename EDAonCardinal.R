library(readxl)
library(ggplot2)
library(tidyverse)

#reads in the data 
CardinalSD <- read_excel("CardinalSampleData.xlsx")
View(CardinalSampleData)

#converts to a date for
CardinalSD$Date<-as.Date(CardinalSD$Date)
colnames(CardinalSD)<-c("Date","AvgTemp","WindGust","LeafWet","Precp","AvgHumid","Radiation","Pressure")
colnames(CardinalSD)

#boxplots all free scaled
ggplot(stack(CardinalSD[,-1]))+geom_boxplot(aes(y=values))+facet_wrap(~ind,scales = "free_y")

#simple density plot of one variable
ggplot((CardinalSD[,-1]))+geom_density(aes(x=AvgTemp))
