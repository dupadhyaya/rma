# Groceries Example 2 ####

library(arules)
library(arulesViz)
library(datasets)
data('Groceries')
str(Groceries)

#Lets Apply Apriori Algorithm
frequentItems <- eclat (Groceries, parameter = list(supp = 0.07, maxlen = 15)) 
itemFrequencyPlot (Groceries,topN=10,type="absolute")

rules <- apriori (Groceries, parameter = list(supp = 0.001, conf = 0.5))

quality(rules) 
head(quality(rules))
options (digits=2)
inspect (rules[1:5])

rules <- sort (rules, by="confidence", decreasing=TRUE)

#How To Control The Number Of Rules in Output ?
rules <- apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, maxlen=3)) # maxlen = 3 limits the elements in a rule to 3

#How To Remove Redundant Rules ?
redundant <- which (colSums (is.subset (rules, rules)) > 1) 
redundant
rules <- rules[-redundant] 

#Find what factors influenced an event ‘X’
rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))

#Find out what events were influenced by a given event

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.15,minlen=2), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) 

#Remove redundancies
rules <- sort (rules, decreasing=TRUE,by="confidence")
redundant <- which (colSums(is.subset(rules, rules)) > 1) 
redundant
rules <- rules[-redundant]
rules

#Making Rules For Continuous Data

#discretize (x, method="cluster", categories=3) 

#Visualizing The Rules

# Interactive Plot

plot(rules[1:5],method="graph",interactive=TRUE,shading="confidence") 
plot (rules, measure=c("support", "lift"), shading="confidence")

# Calculates affinity - the 'nxn' Jaccard Index affinity matrix
affinity(transDat) 
# Adds "Item 1" to all transactions in transDat
transDat_c <- addComplement(transDat, "Item 1") 
duplicated(rules) # find out if any rule is duplicated


# Adult ----
data("Adult")
head(Adult)
LIST(Adult[1:5])
rulesA1 = apriori(Adult)
inspect(rulesA1[1:5])
inspect(rulesA1[1:5], ruleSep="---->", itemSep="+", setStart = "", setEnd ="",   linebreak = FALSE)


# Change to any data Frame
#myDataFrame= Groceries
#transDat <- as (myDataFrame, "transactions") 
transDat
inspect (transDat[1:10]) 
inspect (transDat[10]) 

?inspect
length (transDat)
size (transDat)
LIST(transDat) 
