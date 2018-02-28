# Regression : Areas vs Sales

X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

mean(X); mean(Y)
sum(X); sum(Y)
cov(X,Y); cov(Y,X)
cor(X,Y) ; cor(Y,X)
plot(X,Y,xlab='Area in sqft', ylab='Sales Amount', type='p')
fit1 = lm(Y ~ X)
summary(fit1)
abline(fit1)
abline(v=3,h=5.9742, col='red')

Y = 0.9645 + 1.6699 * 3

df1 = data.frame(X,Y)

new1 = data.frame(X=c(1,2,3,4,5))
new2 = data.frame(X)
predict(fit1, newdata=new1)
predict(fit1, newdata= new2)
X ; Y
df1$predict = predict(fit1, newdata= new2)
df1
df1$diff = df1$predict - df1$Y
df1
