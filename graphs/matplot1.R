# Matrix Plot
salemonth = month.abb[1:12]
product1 = round(runif(12,10,100),2)
product2 = round(runif(12,10,100),2)
sales = cbind(product1, product2)
rownames(sales) = salemonth
sales
?matplot(sales)
matplot(sales, type='l')
?matplot
#More options
?plot
matplot(sales, type = c("b","s"), pch=1,col = 1:2,xaxt="n", xlab='Month', ylab='Sales Amount' ) #plot
legend("topright", inset = 0.01, legend = c('P1','P2'), horiz=T, col=1:2, pch=1, cex=0.5) # optional legend
text(1:12, product1, labels=c('P1'), cex=.5)
text(1:12, product2, labels=c('P2'), cex=.5, col='green')

axis(1, at = 1:12, labels = rownames(sales), cex.axis = 0.7)
