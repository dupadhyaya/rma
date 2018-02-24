#Segmentation

#install.packages("amap")
library(amap)


cust_data = read.csv("./clust/segmdata.csv", skip=1)
names(cust_data)
summary(cust_data[1:5])
head(cust_data)
k1<-Kmeans(cust_data[,-c(1)],3, 
           iter.max = 200, 
           nstart = 1, 
           method = c("euclidean"))

#group means for each variable
k1$centers
###Fetch size/n of obs for the groups
k1$size
###Fetch sum of squared  for the groups
k1$withinss
###Fetch the cluster for each obs
#k1$cluster
# plot
clus <- kmeans(cust_data, centers=3)
?plotcluster(cust_data, clus$cluster)


# 
# 
data_clus_2 <- cust_data[ k1$cluster == 2,]

# Write CSV
write.csv(data_clus_2[,1], file = "./clust/data_clus_2.csv")

mydata=cust_data

# Determine number of clusters
wss <- (nrow(mydata)-1) * sum(apply(mydata,2,var))
wss
for (i in 2:15) wss[i] <- sum(kmeans(mydata, centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")

