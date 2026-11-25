library(tidyverse)
data <- read.csv("C:/Users/kates/Downloads/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition/ObesityDataSet_raw_and_data_sinthetic.csv")
any(is.na(data))
str(data)
boxplot(data$Age, main = "Age Distribution")
boxplot(data$Height, main = "Height Distribution")
boxplot(data$Weight, main = "Weight Distribution")

# Hierarchical clustering

library(cluster)

data_x = data[, !names(data) %in% "NObeyesdad"]
str(data_x)

# Ordinal variables
data_x$CALC <- ordered(
  data_x$CALC,
  levels = c("I do not drink", "Sometimes", "Frequently", "Always")
)

data_x$CAEC <- ordered(
  data_x$CAEC,
  levels = c("No", "Sometimes", "Frequently", "Always")
)

# Nominal variables
data_x$Gender <- factor(data_x$Gender)
data_x$family_history_with_overweight <- factor(data_x$family_history_with_overweight)
data_x$FAVC <- factor(data_x$FAVC)
data_x$SMOKE <- factor(data_x$SMOKE)
data_x$SCC <- factor(data_x$SCC)
data_x$MTRANS <- factor(data_x$MTRANS)

# Gower distance
gower_distance <- daisy(data_x, metric = "gower")
gower_distance

h_cluster <- hclust(gower_distance, method = "complete")
h_cluster2 <- hclust(gower_distance, method = "single")
h_cluster3 <- hclust(gower_distance, method = "average")
# Average linkage
plot(h_cluster3, labels = FALSE,
     main = "Hierarchical Clustering of Obesity Data",
     xlab = "Individuals",
     ylab = "Gower Distance")
# Compare numbers of clusters
cluster2 <- cutree(h_cluster3, k=2)
cluster3 <- cutree(h_cluster3, k=3)
cluster4 <- cutree(h_cluster3, k=4)
cluster5 <- cutree(h_cluster3, k=5)
cluster10 <- cutree(h_cluster3, k=10)
cluster15 <- cutree(h_cluster3, k=15)
cluster20 <- cutree(h_cluster3, k=20)

table(cluster2)
table(cluster3)
table(cluster4)
table(cluster5)
table(cluster10)
table(cluster15)
table(cluster20)

# Find lengths
length3 <- silhouette(cluster3, gower_distance)
length4 <- silhouette(cluster4, gower_distance)
length5 <- silhouette(cluster5, gower_distance)
# Compare averages
mean(length3)
mean(length4)
mean(length5)

mean(length3[,3])
mean(length4[,3])
mean(length5[,3])


