#Here is a test R file 

vec<-c(1,2,3,4,5)
vec2<- c(4,5,6,9,11)

model1<-lm(vec2~vec)

summary(model1)
# I added some R code
plot(vec,vec2)
abline(model1)
