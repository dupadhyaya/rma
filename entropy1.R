library("entropy")
# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)
entropy(y, method="ML")
y=sample(c('M','F'), 30, prob=c(.4,6), replace=T)
entropy(y)
library(ineq)
data(AirPassengers)
AirPassengers
ineq(AirPassengers,type="Gini")
ineq(studentsplay$gender, type="Gini")
ineq(studentsplay$class, type="Gini")
ineq(studentsplay$, type="Gini")
