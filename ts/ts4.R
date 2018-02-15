# fit an ARIMA model of order P, D, Q
fit <- arima(myts, order=c(p, d, q))
             
# predictive accuracy
library(forecast)
accuracy(fit)
         
# predict next 5 observations
library(forecast)
forecast(fit, 5)
plot(forecast(fit, 5))



library(forecast)
# Automated forecasting using an exponential model
fit <- ets(myts)

# Automated forecasting using an ARIMA model
fit <- auto.arima(myts)