# Association Rule - Set 3 ###
#http://www.salemmarafi.com/code/market-basket-analysis-with-r/
#if this, then that”.

# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set : Items set structure - List Type; Cannot see properly
data(Groceries)
str(Groceries)
head(Groceries)

# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")
#minsupport to 0.001 , min conf of 0.8 ; show top 5 rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])
#[3] if someone buys yogurt & cereals, they are 81% likely to buy whole milk too.
summary(rules)

rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(head(rules))


#Rule 4/ other is perhaps excessively long. Lets say you wanted more concise rules. That is also easy to do by adding a “maxlen” parameter to your apriori function:
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))
inspect(head(rules))

# Redundancies ####
subset.matrix <- is.subset(rules, rules)
subset.matrix
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
subset.matrix
redundant <- colSums(subset.matrix, na.rm=T) >= 1
redundant
rules.pruned <- rules[!redundant]
rules<-rules.pruned
inspect(rules)
summary(rules)
# Target Items
#  What are customers likely to buy before buying whole milk
#What are customers likely to buy if they purchase whole milk?
# 1st part
rules1<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules1<-sort(rules1, decreasing=TRUE,by="confidence")
inspect(rules1[1:5])
#Likewise, we can set the left hand side to be “whole milk” and find its antecedents.

#  We set the confidence to 0.15 since we get no rules with 0.8
#We set a minimum length of 2 to avoid empty left hand side items
rules2 <-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules2 <- sort(rules2, decreasing=TRUE,by="confidence")
inspect(rules2[1:5])

# Visualisation ####

library(arulesViz)
# Interactive Graph - Seperate Window
plot(rules,method="graph",interactive=T,shading=NA)



