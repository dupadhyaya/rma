#https://www.statmethods.net/advstats/timeseries.html

# save a numeric vector containing 72 monthly observations
# from Jan 2009 to Dec 2014 as a time series object
sales = runif(72, 10,100)
?runif
sales
sales= round(sales)
myts <- ts(sales, start=c(2009, 1), end=c(2014, 12), frequency=12) 
myts
# subset the time series (June 2014 to December 2014)
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12)) 
myts2
# plot series
plot(myts)
