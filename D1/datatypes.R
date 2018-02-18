# R Programming

#Categorical Data
product = c('maggi', 'top ramen', 'hakka')
product
shirtcolor = c('green', 'red', 'blue', 'black')
shirtcolor
rating = c('Excellent', 'Very Good', 'Good', 'Average', 'Poor' )
rating
str(rating)
performance = c( 1, 2, 3, 4, 5)
str(performance)

decision = c('buy', 'sell')
decisionTF = c(TRUE, FALSE )
str(decision); str(decisionTF)
grades = c('A','C','B','D','E','B')
itemssold = c(10, 20, 30, 25)


#Nominal Data
product

#Ordinal Data
performance
#need to create order
performance1 = factor(performance, ordered=T, levels=c(1,2,3,4,5))
performance1
rating
rev(rating)
rating1 = factor(rating, ordered=T, levels=rev(rating))
rating1

grades
grades1 = factor(grades, ordered=T, levels=c('F','E','D','C','B', 'A'))
grades1
summary(grades1)



# Data Properties
set.seed(10)
sales1 = rnorm(100, mean=50, sd=10)
sales1

set.seed(10)
sales2 = rnorm(100, mean=60, sd=10)
sales2


sales3= c(1,5,2,5,2,3,6,7,8,4,5)
sales3
#


shirtcolor = c('green', 'red', 'blue', 'black')
sellitems = sample(shirtcolor, 20, replace=T, prob=c(.4,.3,.2,.1)) 
sellitems
summary(sellitems)
table(sellitems)

grades = c('A','C','B', 'D','E', 'B', 'A', 'B', 'A', 'C','F')
grades1 = factor(grades, ordered=T, levels=c('F','E','D','C','B', 'A'))
grades1


#Location / Central Tendency
mean(sales1)
mean(sales2)
mean(sellitems)
mean(grades)
mean(sales3)

#Middle Values
median(sales1)
median(sales2)
median(sales3)
sort(sales3)
quantile(sales3)

median(sellitems)
median(grades1)


#Mode
mode(sales1)  # error
library(modeest)
mlv(sales1, method='mfv')
mlv(sales2, method='mfv')
mlv(sales3, method='mfv')
mlv(sellitems, method='mfv')
mlv(grades1, method='mfv')
table(sale3)
table(sellitems)
table(grades1)
which.max(table(grades1))



# Graphical Way
mean(sales1)
hist(sales1)
plot(density(sales1))
abline(v=50)

hist(sales2, prob=T)
lines(density(sales2), col='red')
abline(v=60, col="green")

# Combine Plots
plot(density(sales1), col='green', ylim=c(0,0.05))
lines(density(sales2), col="blue", lwd=2)
abline(v=c(50,60), col=c('green', 'blue'), lwd=3)
