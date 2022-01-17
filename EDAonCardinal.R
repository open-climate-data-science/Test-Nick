library(readxl)
library(ggplot2)
library(tidyverse)

#reads in the data 
CardinalSD <- read_excel("CardinalSampleData.xlsx")
View(CardinalSD)

#converts to a date for
CardinalSD$Date<-as.Date(CardinalSD$Date)
colnames(CardinalSD)<-c("Date","AvgTemp","WindGust","LeafWet","Precp","AvgHumid","Radiation","Pressure")
colnames(CardinalSD)

#boxplots all free scaled
ggplot(stack(CardinalSD[,-1]))+geom_boxplot(aes(y=values))+facet_wrap(~ind,scales = "free_y")

#simple density plot of one variable
ggplot((CardinalSD[,-1]))+geom_density(aes(x=AvgTemp))


#### SAMPLE LOGISTIC REGRESSION!!!

# new categorical variable

CardinalSD$RainYN<- as.factor(as.numeric(CardinalSD$Precp>0))
CardinalSD


mod1.logit <- glm(RainYN ~ AvgHumid,data=CardinalSD, family=binomial)

summary(mod1.logit)


plot(CardinalSD$AvgHumid, jitter((as.numeric(CardinalSD$Precp>0)),.1))

lines(CardinalSD$AvgHumid[order(CardinalSD$AvgHumid)],fitted(mod1.logit)[order(CardinalSD$AvgHumid)],lty=2,col=3)

