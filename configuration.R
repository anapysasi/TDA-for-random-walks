# T: number of steps
# random_type: choices between "Bernoulli" and "Normal_dist" (They must be in "")
# return2zero: If you want your random walk to start and finish in zero
# p: If random_type = "Bernoulli" you can add the probability. The default value is p=0.5

main_directory <- "C:/Users/Ana Ysasi Cillero/Documents/Erasmus/Florida/Academic_Training/CODE2"
setwd(main_directory) 
source("rand_walk.R")

configuration <-  function(T, random_type ,return2zero, p = 0.5) {
    
  if (random_type == "Bernoulli") {
    random_walk <- Bernoulli(T,p)
  } else if (random_type == "Normal_dist") {
    random_walk <- Normal_dist(T)
  } else if(random_type != "Bernoulli" | random_type != "Normal_dist"){
    print("Did not enter proper randomtype. Try again with Bernoulli or Normal_dist and make sure the input is a character (is in between double quotes)")
    break}
  
  if (return2zero == TRUE) {
    random_walk <- return_zero(random_walk)
  }
  return(random_walk)
}
