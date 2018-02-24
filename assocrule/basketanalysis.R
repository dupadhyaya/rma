# Basket Analysis
# 
A=c(1,1,0,1,0)
B=c(1,0,0,0,1)
C=c(1,1,1,1,1)
D=c(0,1,1,0,0)
E=c(0,0,0,1,1)
df =data.frame(A, B, C, D, E)
df
df = data.frame(A=A, B=B, C=C, D=D, E=E)
row.names(df)=c('B1','B2','B3','B4','B5')
df

#
library(arules)
library(arulesViz)

rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))