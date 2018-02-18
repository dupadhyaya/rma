# Graphs for MA

salemonth = month.abb[1:12]
salemonth  # order of variables not correct
salemonth = factor(salemonth, ordered=T, levels=month.abb[1:12])
salemonth
product1 = round(runif(12,10,100),2)
product2 = round(runif(12,10,100),2)
sales = data.frame(salemonth, product1, product2)
str(sales)
# ok
plot(salemonth, product1, data=sales, type='l', col='red')
plot(salemonth, product2, data=sales, type='l', col='red')
par(options)
abline(lm(product2 ~ salemonth))
lines(lowess(product2 ~ salemonth))
