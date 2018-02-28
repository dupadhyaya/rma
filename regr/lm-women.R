# Regression Analysis

data(women)
women
str(women)
cov(women$height, women$weight)
cor(women$height, women$weight)
plot(women)
names(women)  #x- IV, y -DV
plot(women, xlim=c(0,75), ylim=c(0,180))

?lm
fit1= lm(formula= weight ~ height, data= women)
summary(fit1)
abline(fit1)
df=women
df$predict = predict(fit1, newdata=data.frame(height=women$height))
df
abline(v=60)
abline(h=119)
