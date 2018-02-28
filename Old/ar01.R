# Association Rule Example 1 ####
#http://www.rdatamining.com/examples/association-rules
str(titanic.raw)

#write.csv(titanic.raw,file="titanic.csv")
load('titanic.raw.rdata')
library(arules)
str(titanic.raw)
# Find Association Rules with Default Settings
rules = apriori(titanic.raw)
inspect(rules)
# Set rhs=c("Survived=No", "Survived=Yes") in appearance to make sure that
#only "Survived=No" and "Survived=Yes" will appear in the rhs of rules.

rules = apriori(titanic.raw, parameter = list(minlen=2,supp=.005,conf=0.8),
            list(rhs=c("Survived=No","Survived=Yes"),default="lhs"), control=list(verbose=F))
rules.sorted = sort(rules, by="lift")
inspect(rules.sorted)

# Pruning Redundant Rules
#In the above result, rule 2 provides no extra knowledge in addition to rule 1, since rules 1 tells us that all 2nd-class children survived. Generally speaking, when a rule (such as rule 2) is a super rule of another rule (such as rule 1) and the former has the same or a lower lift, the former rule (rule 2)
#is considered to be redundant. Below we prune redundant rules. 
# find redundant rules
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
subset.matrix

redundant <- colSums(subset.matrix, na.rm=T) >= 1
subset.matrix
redundant
which(redundant)
# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)

# Visualising
library(arulesViz)
plot(rules)

plot(rules, method="graph", control=list(type="items"))

plot(rules, method="paracoord", control=list(reorder=TRUE))

