# Clustering - Iris Data Set

#Method1----
set.seed(20)  #reproducibility
k1 <- kmeans(x=iris[, 1:4], centers=3)
k1
fpc::plotcluster(iris[,1:4], k1$cluster)




library(datasets)
head(iris)

library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

# Clustering ----------------

#try to cluster it. Since the initial cluster assignments are random, let us set the seed to ensure reproducibility.

str(iris)
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster

table(irisCluster$cluster, iris$Species)

# Plot
irisCluster$cluster <- as.factor(irisCluster$cluster)

ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color = irisCluster$cluster)) + geom_point()



