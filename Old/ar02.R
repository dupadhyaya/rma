# Association Rules ####
# Using 
#http://blog.revolutionanalytics.com/2015/04/association-rules-and-market-basket-analysis-with-r.html

library(apriori)
load("titanic.raw.rdata")
# if not available library(arules)
# Library contains apriori and eclat
# Apriori - Breadth first, ECLAT - depth first
# draw a sample of 5 records
idx = sample(1:nrow(titanic.raw),5)
titanic.raw[idx,]
summary(titanic.raw)
# Apriori Default Settings : min supp=0.1 , conf=0.8; maxlen=10 (rules)

rules.all = apriori(titanic.raw)
inspect(rules.all)
# rules with rhs containing Survived only
rules = apriori(titanic.raw, 
                control=list(verbose=F), 
                parameter = list(minlen=2, supp=0.005, conf=0.8))
                appearance = list(rhs=c('Survived=No','Survived=Yes'),
                                  default='lhs'))
# keep 3 decimal places
quality(rules) = round(quality(rules), digits=3)
# order rules by lift
rules.sorted = sort(rules,by='lift')
inspect(rules.sorted) 
# Some errors with rhs values, not seen as per parameter value
# Removing Redundancy
inspect(rules.sorted[1:2])
# Find Redudant Rules

