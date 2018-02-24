# Clustering
# Cluster 49 cities of american largest cities
# Group in two 4 cluster with similarieites
# Choose a city to ancho or center each cluster

library(cluster)
library(fpc)
clusdata1 = read.csv('./data/cluster.csv', skip=1)
summary(clusdata1)
clusdata = clusdata1
names(clusdata)

set.seed(20)
k1 <- kmeans(x=clusdata[, 2:6], centers=4)
k1
fpc::plotcluster(clusdata[,2:6], k1$cluster)


cluster::clusplot(clusdata, k1$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)


# Plot with any 2 variables
clusdata$cluster <- as.factor(k1$cluster)
names(clusdata)
ggplot(clusdata, aes(x=mage, y=asianp, color = clusdata$cluster)) + geom_point()
