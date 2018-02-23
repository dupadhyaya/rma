#Denco Case

# Import/read the data ----
txn_data<-read.csv("./assocrule/onlinedata.csv")

### See the data summary (verify Data)
head(txn_data)
tail(txn_data)
summary(txn_data)

#install.packages("arules")
library(arules)
##library(arulesSequences)
smpl_dat =txn_data
# factorization of variables
for ( i in 1:ncol(smpl_dat))
{
  smpl_dat[,i]=as.factor(smpl_dat[,i])
}
#Plot of relative frequency
?as
smpl_dat<-as(smpl_dat,"transactions")
smpl_dat
head(inspect(smpl_dat))
itemFrequencyPlot(smpl_dat, topN = 9)


# Running aproiori command
basket_rules <- apriori(smpl_dat, parameter = list(sup = 0.005, conf = 0.01, target="rules",minlen=2,maxlen=3))

summary( basket_rules)
inspect(  basket_rules) # see all the rules
inspect(head(sort( basket_rules,by="lift"),3))	

