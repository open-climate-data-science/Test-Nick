# Another test R file 
# logistic regression basic tutorial idea


#subets data
# consdiers all rows that are not the third level
irissub<-subset(iris, Species != levels(iris$Species)[3])

# table of frequecy 
table(irissub$Species)

# new set of levels 
levels(irissub$Species)

# drops the only level virginica
irissub$Species<-droplevels(irissub)$Species



# makes new coloumn for response varable  
irissub$ISversi <- as.integer(irissub$Species=="versicolor")



# makes logistic regression model 
model1<-glm(ISversi~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data=irissub,family="binomial")
model1

# summary of model 
summary(model1)



# plot that shows this
plot(irissub$Sepal.Length,jitter(irissub$ISversi,.1),col="red",xlab="Sepal Length",
     ylab="Species",main="Probability Plot of Versicolor Species")
# linear regrssion (not so good here)
lines(lowess(irissub$ISversi~irissub$Sepal.Length),col="green")

# Logit regression curve
lines(irissub$Sepal.Length[order(irissub$Sepal.Length)], fitted(model1)[order(irissub$Sepal.Length)],lty=2,col="blue")







### Simple regression in R for iris, change to penguin
library(ggplot2)
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length,colour=Species,shape =Species))+
  geom_point()+
  geom_smooth(method='lm',formula=y~x,se = FALSE)
