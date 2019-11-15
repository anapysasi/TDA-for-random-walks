# num_rep: number of random walks in each trial
# T: number of steps
# random_type: choices between "Bernoulli" and "Normal_dist" (They must be in "")
# return2zero: If you want your random walk to start and finish in zero
# p: If random_type = "Bernoulli" you can add the probability. The default value is p=0.5

main_directory_1 <- "C:/Users/Ana Ysasi Cillero/Documents/Erasmus/Florida/Academic_Training/CODE2"
setwd(main_directory_1) 
source("configuration.R")


main_directory_2 <- "C:/Users/Ana Ysasi Cillero/Documents/Erasmus/Florida/Academic_Training/CODE"
setwd(main_directory_2) 
source("union_find_functions.R")

persistence <- function(num_rep, T, random_type ,return2zero, p = 0.5){ 
  start_time <- Sys.time()
  
  #Compute the persistence diagram
  per_dg <- matrix(0, nrow = T*num_rep, ncol = 3)
  L <- 1
  for (i in 1:num_rep) {
    rand_walk <- configuration(T,random_type, return2zero, p)
    vertex_values <- rand_walk$y
    num_v <- length(vertex_values)
    edges <- matrix( c(1:(num_v-1), 2:num_v), nrow = (num_v-1), ncol = 2)
    pd <- pers_hom_filtered_graph(edges,vertex_values)
    len_pd <- length(pd[,1])
    per_dg[L:(L+len_pd-1),] <- matrix(c(matrix(i,nrow = len_pd, ncol = 1),pd[,1],pd[,2]),nrow = len_pd, ncol = 3)
    L <- L + len_pd
  }
  per_dg <- per_dg[as.logical(rowSums(per_dg != 0)), ]
  # per_dg is a matrix which first column is going to be the index of the computed random walk 
  # and the other two columns correspond to the persistence diagram of that random walk 
  
  # bounds and step size for landscapes
  minx <- min(per_dg[,2:3])
  maxx <- max(per_dg[,2:3])
  dx <- max(0.1, (maxx-minx)/200)
  
  # computation of the landscapes
  pd1 <- matrix(per_dg[per_dg[,1]==1],ncol = 3)[,2:3]
  pl1 <- landscape(pd1, exact = FALSE, dx = dx, min_x= minx, max_x = maxx)
    
    
    for (j in 2:num_rep) {
      pd <- matrix(per_dg[per_dg[,1]==j],ncol = 3)[,2:3]
      pl <- landscape(pd, exact = FALSE, dx = dx, min_x= minx, max_x = maxx)
      pl1 <- PLsum(pl,pl1)
      if (j == num_rep/2) {
        print(paste0("the process has exceeded the average of ", num_rep/2, " the persistence landscapes")) 
      }
    }
    pl1_av <- PLscale(1/(num_rep), pl1)
    
    end_time <- Sys.time()
    print(paste0("time needed for the process ",end_time - start_time))
    
  return(list(per_dg,pl1_av))
}