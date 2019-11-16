# Documentation: random walks and configuration


# Topological Data Analysis of Random functions (Random walks)
### Author: Ana Pilar Ysasi Cillero


## Installations

Clone the github repo either using git clone <https://github.com/anapysasi/TDA-for-random-walks.git> or just download from Github using the green button.

![f5]

### Random walks calculations

This program alouds you to create different types of random walks, varying the probability as follows:  

1. __Bernoulli random walk with probability p__: Is the serie defined by ![f1] where  ![f2]. Where  ![f3] are the i.i.d random variables which are going to determined as +1 with probability p and -1 with probability (1-p). Also define  ![f4] (we want the paths to start at the origin). 

[f1]: http://chart.apis.google.com/chart?cht=tx&chl=\\{S_{n}\\}
[f2]: http://chart.apis.google.com/chart?cht=tx&chl=S_n=\\sum_{i=1}^{n}Z_n
[f3]: http://chart.apis.google.com/chart?cht=tx&chl=Z_n
[f4]: http://chart.apis.google.com/chart?cht=tx&chl=Z_0=0 
[f5]: http://chart.apis.google.com/chart?cht=tx&chl=S_n(t)=\\frac{1}{\sqrt{T}}\\sum_{1\\leq{k}\\leq{T}}Z_k,\\quad\{T}\\in\\mathbb{N} 

On the other hand, it is interesting how the random walks approximate to another type of random function, the __Wiener process__. 

2. Hence, the other type of random functions which we are going to be able to generate are __Wiener processes__. In this case let the random variables ![f3] be i.i.d and distributed as normal with mean 0 and variance of 1. Hence, the random step function is going to be given as: 

![f5]

A example for both cases would be:

```{r, echo=TRUE}
rand_walk <- Bernoulli(T = 100,p = 0.5)
Wiener <- Normal_dist(T = 100)
```

If you want to visualize them, you can plot them by using ```plot_rand_walk()```
```{r, echo=TRUE}
p1 <- plot_rand_walk(rand_walk) 
p2 <- plot_rand_walk(Wiener)%>%
  layout(showlegend = FALSE)
subplot(p1, p2)
```


### Return to zero

In most of the study we are really interested in making sure that the graph which we are computing the peristence starts and ends in zero. For that, the program has an extra function which extract the line that joins the start point $x_0 =(0,0)$ and end point $x_T = (T,S_t)$ [I should add here what Peter said about why making this transformation doesn't really matter for the persistence. Just to make sense of why are we doing this]. 

Let's show an example of a random walk, in which we indicate the line that we are going to substract and after that we'll compute the resulting graph.

```{r, echo=TRUE}
rw <- Bernoulli(T = 100, p = 0.5)
rw_zero <- return_zero(rw)
#the function return_zero() gives us the random walk after subtracting the correspondent line
```
```{r, echo=FALSE}
len <- length(rw$time)
m <- rw$y[len]/rw$time[len]
line_y <- c()
for (i in 0:99) {
  y0 <- m*i
  line_y <- c(line_y, y0)
}
line <- data.frame(time <- 0:99, y1 <- line_y, y2 = rw$y) #This is a data frame with the line and the random walk
p1 <- plot_ly(line, x = ~ time, y= ~ y2,  type = 'scatter', mode = 'line', name = "random walk")%>%
  add_trace(line, x = ~ time, y= ~ y1,  type = 'scatter', mode = 'line', name = "line")%>%
  layout(showlegend = FALSE)

p2 <- plot_rand_walk(rw_zero)%>%
  layout(showlegend = FALSE)%>%
  layout(colorway = c('black', 'black')) 
subplot(p1, p2)
```


## Configruation.R

Is a function which pretends to collaps all the previous funtions by giving you as an output any of the random walks defiend before. The sintaxis is very simple, you just need to put the following outputs:


1. __T__: number of steps in the random walk
2. __random_type__: choices between "Bernoulli" andn "Normal_dist" (Notice that they must be in between "")
3. __return2zero__: Boolean Argument. If you want your random walk to start and finish in zero, set as TRUE
4. __p__: If random_type = "Bernoulli" you can add the probability. The default value is $p=0.5$
