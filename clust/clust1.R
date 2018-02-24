#Clustering - Built in Data Set

library(cluster)
library(fpc)

#Simple Eg
X <- data.frame(c1=c(0,1,2,4,5,4,6,7),c2=c(0,1,2,3,3,4,5,5))
km <- kmeans(X, center=2)
km
plot(X,col=km$cluster)
points(km$center,col=1:2,pch=8,cex=1)
cluster::clusplot(X, km$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


#Iris



k1 <- kmeans(x=iris[, 1:4], centers=3)
k1
k1$centers
plot(k1)
plot(k1, data=iris)
clus <- kmeans(iris[,1:4], centers=3)
cluster::plotcluster(cust_data, clus$cluster)
?plotclus


#Example2 -----
library(cluster)
library(fpc)

data(iris)
dat <- iris[, -5] # without known classification 
# Kmeans clustre analysis
clus <- kmeans(dat, centers=3)
# Fig 01
plotcluster(dat, clus$cluster)

clusplot(dat, clus$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


with(iris, pairs(dat, col=c(1:3)[clus$cluster])) 


?hclust
?cutree
