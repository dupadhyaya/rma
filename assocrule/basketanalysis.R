# Basket Analysis
# 
A=c(1,1,NA,1,NA)
B=c(1,NA,NA,NA,1)
C=c(1,1,1,1,1)
D=c(NA,1,1,NA,NA)
E=c(NA,NA,NA,1,1)
df =data.frame(A, B, C, D, E)
df
df = data.frame(A=A, B=B, C=C, D=D, E=E)
row.names(df)=c('B1','B2','B3','B4','B5')
df
df= lapply(df,factor)
str(df)
df
#
library(arules)
library(arulesViz)

## convert to transaction
trans <- as(df, "transactions")
trans
summary(trans)
inspect(trans)


rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))