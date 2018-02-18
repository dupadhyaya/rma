# MA - Chapter-1
# 

pareto = read.csv("./mabook/pareto.csv")
sales = pareto # make a copy
summary(sales)
head(sales)
#sales has $ and is character type
gsub('$','', '$3')
sales$Price = gsub('\\$','', sales$Price)
summary(sales)
head(sales)
sales$Price = as.numeric(sales$Price)
colSums(is.na(sales))   # missing values
str(sales)
aggregate(sales$Price,by=list(sales$Store), sum)

library(dplyr)
names(sales)
sales %>% 
   group_by(Store) %>% 
   summarise(sum_allow=sum(Price)) %>% 
   mutate(pct_allow=sum_allow/sum(sum_allow))

sales %>% 
  group_by(Month) %>%
  summarise(sum_allow=sum(Price)) %>% 
  mutate(pct_allow=sum_allow/sum(sum_allow)) %>%
#  arrange(pct_allow) %>%
  data.frame()
# Months not in the order

month.name[1:12]
month = factor(month.name[1:12], ordered=T, labels=month.name[1:12])
month
sales$Month

sales$Month = factor(sales$Month,levels =month.name[1:12] )
sales$Month

sales %>% 
  group_by(Month) %>%
  summarise(sum_allow=sum(Price)) %>% 
  mutate(pct_allow=sum_allow/sum(sum_allow)) %>%
  data.frame()
# Months now in the order

names(sales)
# Pareto Chart

aggregate(sales$Price, by=list(sales$Product), sum)
prodsales= setNames(aggregate(sales$Price, by=list(sales$Product), sum),c('Product' ,'TotalSales'))

prodsales
names(prodsales)
head(prodsales[order(prodsales$TotalSales, decreasing = TRUE),])



# Pg 11 Report Filter & Slicers
names(sales)
aggregate(sales$Price, by=list(sales$Product), sum, mean)
aggregate(cbind(val1, val2) ~ id1 + id2, data = x, FUN = plyr::each(avg = mean, n = length))
aggregate(Price ~ Store , data = sales, FUN = plyr::each(avg = mean, n = length))
aggregate(Price ~ Product , data = sales, FUN = plyr::each(avg = mean, n = length))
aggregate(Price ~ Month + Store , data = sales, FUN = plyr::each(avg = mean, n = length))

# Sales Sales at Bakery
bakery = read.csv('./mabook/BakeryData.csv', stringsAsFactors = F)
summary(bakery)
dim(bakery)
colSums(is.na(bakery))
sapply(bakery, class)
names(bakery)
sum(is.na(bakery$Date))
summary(bakery$Date)

library(lubridate)
bakery$Date <- as.Date(bakery$Date,'%m/%d/%Y')
summary(bakery$Date)
wday(df$date, label=TRUE)

strftime(bakery$Date,'%A')
weekdays(bakery$Date)
wday(bakery$Date, label=TRUE)
as.POSIXlt(bakery$Date)$wday
names(bakery)
(df=aggregate(bakery[c('Cakes', 'Pies', 'Cookies', 'Smoothies', 'Coffee')], by=list(weekday = weekdays(bakery$Date)), FUN= mean))
matplot(df)
aggregate( cbind(Cakes, Pies, Cookies, Smoothies, Coffee) ~ weekdays(bakery$Date) ,data=bakery, FUN=mean)


library(ggplot2)

ggplot(data = df, aes(x = weekday)) + 
  geom_line(aes(y = Cakes)) + 
  geom_line(aes(y = Pies)) +
  geom_line(aes(y = Cookies)) +
  geom_line(aes(y = Smoothies)) +
  geom_line(aes(y = Coffee)) +
  labs(y = "Avg Sales") # Delete or change y axis title if desired.

matplot(as.matrix(df[,1]),as.matrix(df[,-1]),type='l')
df2= as.matrix(df[,-1])
?matplot
matplot(as.matrix(df[,1]),df2,type='l')
