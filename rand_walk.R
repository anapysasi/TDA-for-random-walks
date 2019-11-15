Bernoulli <- function(T,p) {
  x <- runif(T-1, min = 0, max = 1)
  x[x  > p] <- 1
  x[x  <= p] <- -1 
  x <- c(0,x)
  y=cumsum(x) 
  rand_walk <- data.frame(time = 0:(T-1), y = y) 
  return(rand_walk)
}

Normal_dist <- function(T) {
  x <- rnorm(n = T-1, mean = 0, sd = 1) ##### CHECK
  x <- c(0,x)
  y=cumsum(x)/sqrt(T)
  rand_walk <- data.frame(time = 0:(T-1), y = y) 
  return(rand_walk)
}

return_zero <- function(random_walk) {
  len <- length(random_walk$time)
  m <- random_walk$y[len]/random_walk$time[len]
  y_new <- (random_walk$y - m*random_walk$time)
  random_walk_0 <- data.frame(time = 0:(len -1), y = y_new)
  random_vbles_0 <- c(0,diff(random_walk_0$y))
  return(random_walk_0)
}

library(plotly)
plot_rand_walk <- function(random_walk) {
  minrand <- min(random_walk$y)-1
  maxrand <- max(random_walk$y)+1
  p1 <- plot_ly(random_walk, x = ~ time, y= ~ y,  type = 'scatter', mode = 'line')%>%
    layout(yaxis = list(range = c(minrand,maxrand)))
  return(p1)
}
