# AR Data Formats and Conversion

# Data Format ----

library("arules")

set.seed(101)
transactionID = sample(1:500, 1000, replace=T)
transactionID
item = paste("item", sample(1:50, 1000, replace=T),sep = "")
item
orders <- data.frame(transactionID, item)
head(orders)

write.csv(orders, "./data/talltransactions.csv")
ordertrans <- read.transactions(
  file = "./data/talltransactions.csv",
  format = "single",
  sep = ",",
  cols=c("transactionID","item"),
  rm.duplicates = T
)
summary(ordertrans)



# DataFrame directly to transactions
# Converting to a Matrix ####
summary(orders)
orders$const = TRUE

# Remove duplicates
dim(orders) #1,000 x 3
orders <- unique(orders)
dim(orders) #979 x 3

?reshape
# Need to reshape the matrix
ordersmatprep <- reshape(data = orders,
                           idvar = "transactionID",
                           timevar = "item",
                           direction = "wide")
head(ordersmatprep[,1:3])

# Drop the transaction ID
ordermatrix <- as.matrix(ordersmatprep[,-1])
head(ordermatrix[,1:3])


# Clean up the missing values to be FALSE
ordermatrix[is.na(ordermatrix)] <- FALSE
head(ordermatrix[,1:3])
dim(ordermatrix)

# Clean up names
colnames(ordermatrix)
colnames(ordermatrix) <- gsub(x=colnames(ordermatrix),
       pattern="const\\.", replacement="")
colnames(ordermatrix)

ordertrans2 <- as(ordermatrix,"transactions")
summary(ordertrans2)
