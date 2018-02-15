# Seasonal decomposition


fit <- stl(myts, s.window="period")
fit
plot(fit)

# additional plots
monthplot(myts)
library(forecast)
seasonplot(myts)
