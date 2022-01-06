### Penguins Work 

install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)
library(ggplot)

#drops NA Values
npenguin<-as.tibble(penguins)%>% drop_na() 
npenguin


# count of species
ggplot(npenguin)+geom_histogram(aes(x=species),stat="count")

# creates penguins plot
ggplot(npenguin,aes(x=bill_length_mm,y=body_mass_g,col=island,))+geom_point()+
  geom_smooth(method="lm",se = FALSE, fullrange=TRUE)+
  ggtitle("Impact of Bill Length on Body Mass by Island")



#creates model!
LmModel<- lm(body_mass_g~bill_length_mm+island,data=npenguin) 

#summary of model
summary(LmModel)
