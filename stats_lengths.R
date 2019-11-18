## This script is meant to give some statitical information about the persistence diagram.
# It return the maximum, minimum and the average of the sizes of the intervals. Also the average of the maximum and minimum element reached in the persistence diagram
# Also creates a data frame with the size of the intervals and the # repetitions for all the random walks.

main_directory <- "~/CODE"
setwd(main_directory) 
source("persistence.R")

stats_lengths <- function(num_rep, T, random_type ,return2zero, p = 0.5){ 
# Lets compute the persistence
pd <- persistence(num_rep, T , random_type , return2zero , p )[[1]]
pd <- as.data.frame(pd)
names(pd) <- c("index", "birth", "death") 

# Lets calculate the sizes of the intervals and add it to pd
len_inter <- pd$death - pd$birth
len_inter <- as.data.frame(len_inter)
pd <- cbind(pd, len_inter)

#Now lets compute the mean of the maximum and minimum element in the persistence.
mx <- c()
mn <- c()
for (i in 1:num_rep) {
  max_elem <- max(pd$birth[pd$index == i], pd$death[pd$index == i])
  min_elem <- min(pd$birth[pd$index == i], pd$death[pd$index == i])
  mx <- c(mx, max_elem)
  mn <- c(mn, min_elem)
}
mean_max <- mean(mx)
mean_min <- mean(mn)

# Now lets count how many interval of each size do we have
mean_len <- mean(pd$len_inter)
max_len <- max(pd$len_inter)
min_len <- min(pd$len_inter)

# We need to group the length of the intervals 
len_inter_integer <- round(pd$len_inter,digits=0)
un_len <- sort(unique(len_inter_integer))
pd <- cbind(pd, len_inter_integer)
data_len <- matrix(0, ncol = 2, nrow = length(un_len))
  j <- 0
  for (i in un_len) {
      j <- j+1
      len <- length(pd[pd$len_inter_integer == i,]$index)
      data_len[j,] <- c(i, len)
  }
pd[5] <- NULL
if (data_len[length(data_len[,1]),2] == 0) {
  data_len <- data_len[-length(data_len[,1]),]
}

# To finish, lets make the matrix a dataframe
data_len <- as.data.frame(data_len)
names(data_len) <- c("len_inter", "#rep")

  if (random_type == "Bernoulli") {
    print(paste0("Random walk with p= ", p ,". The average of numbers of intervals is ", round(mean_len, digits = 3) , ". There are intervals of sizes from ", round(min_len, digits = 3) ," to ", round(max_len, digits = 3) ,". The mean of the maximum element reached is ", round(mean_max, digits = 3) ," and the average of the minimum value rechead is ", round(mean_min, digits = 3)))
  }else{
    print(paste0("Random walk with p= ", p ,". The average of numbers of intervals is ", round(mean_len, digits = 3) , ". There are intervals of sizes from ", round(min_len, digits = 3) ," to ", round(max_len, digits = 3) ,". The mean of the maximum element reached is ", round(mean_max, digits = 3) ," and the average of the minimum value rechead is ", round(mean_min, digits = 3)))
  }

return(list(mean_len, min_len, max_len, mean_min, mean_max, data_len))
}
