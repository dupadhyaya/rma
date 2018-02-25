#HH Market Basket Analysis


### Import/read the data
txn_data<-read.csv("./data/hhardata.csv")

### See the data summary (verify Data)
head(txn_data)
tail(txn_data)
summary(txn_data)

#install.packages("arules")
library(arules)
library(arulesSequences)
smpl_dat =txn_data
smpl_dat
# factorization of variables
for ( i in 1:ncol(smpl_dat))
{
  smpl_dat[,i]=as.factor(smpl_dat[,i])
}
head(smpl_dat)
#3 item list
#Plot of relative frequency
smpl_dat<-as(smpl_dat,"transactions")
itemFrequencyPlot(smpl_dat, topN = 9)


# Running aproiori command
basket_rules <- apriori(smpl_dat, parameter = list(sup = 0.005, conf = 0.01, target="rules",minlen=2,maxlen=3))

summary( basket_rules)
inspect(  basket_rules) # see all the rules
inspect(head(sort( basket_rules,by="lift"),3))	

