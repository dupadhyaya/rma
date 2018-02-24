# Clustering - mtcars

d <- dist(as.matrix(mtcars))   # find distance matrix 
hc <- hclust(d)                 # apply hirarchical clustering 
plot(hc)                       # plot the dendrogram
