# TDA-for-random-walks
## Author: "Ana Pilar Ysasi Cillero"



# Topological Data Analysis of Random functions (Random walks)

### Previous Installations

The pacakes used to compute the perisistence diagram and the persistence landscapes require a previous installation. 

For detailed information about this package, installation and use, go to <https://github.com/jjbouza/tda-tools>.

After downloading this package you should be ready to use this functuion without problems.


### Installations

Clone the github repo either using git clone <https://github.com/anapysasi/TDA-for-random-walks.git> or just download from Github using the green button.


## Quickstart Guide:

The ```persistence``` package computes the Persistence Diagram and Persistence Landscapes for different types of random walks.



#### Computation of the random walks:

The first thing you want to do in this process is to generate a random walk. You can vary the probability in which goes up or down one unit by changing the parameter ```p``` (it is by default ```p = 0.5```) 
```R
rand_walk <- Bernoulli(T = 1000, p = 0.5)
```

This would generate a random walk with a thousand steps which will go up or down one unit with equal probability.

If you want the random variables to be distributed with a normal distribution with mean 0 and variance of 1 (instead of being just {1,-1} with probability p and (1-p) respectively), you can use the following function:
```R
rand_walk_nor <- Normal_dist(T = 1000)
```

This type of random functions is really interesting since by taking the limit to infinity it is an approximation to a Wiener process, also known as Browian motion, in one dimension.

You may also be interested in studying a random walk which starts and finishes in 0 (Brownian bridge is an example) and so you can use the following:
```R
rand_walk_zero <- return_zero(Normal_dist(T = 1000))
```

A compact way to write this funtions is just by the use of ```configuration(T, random_type ,return2zero, p)```. If you want to compute the previous functions with this command the inputs will be the following:
```R
rand_walk <- configuration(T = 1000, random_type = "Bernoulli", return2zero = FALSE, p = 0.5)
rand_walk_nor <- configuration(T = 1000, random_type = "Normal_dist", return2zero = FALSE)
rand_walk_zero <- configuration(T = 1000, random_type = "Normal_dist", return2zero = TRUE)
```
To plot the random walks you can directly use the function: ```plot_rand_walk()```. Lets plot the previous random walks:

```R
p1 <- plot_rand_walk(rand_walk)
p2 <- plot_rand_walk(rand_walk_nor)
p3 <- plot_rand_walk(rand_walk_zero)%>%
  layout(showlegend = FALSE)
subplot(p1, p2, p3)
```

#### Computation of the persistence diagram:

To compute the persistence diagram use the function ```persistence()``` and take the first argument of it. You need to provide the same information as in ```configuration()```, but you need to add as the first input ```num_rep``` which is going to be number of random walks in each trial. Lets compute the persistence diagram of the previous examples:
```R
per_1 <- persistence(num_rep = 100, T = 1000, random_type = "Bernoulli", return2zero = FALSE, p = 0.5)
per_2 <- persistence(num_rep = 100, T = 1000, random_type = "Normal_dist", return2zero = FALSE)
per_3 <- persistence(num_rep = 100, T = 1000, random_type = "Normal_dist", return2zero = TRUE)
pd1 <- per_1[[1]]
pd2 <- per_1[[1]]
pd3 <- per_1[[1]]
```

Lets see what is the output of this function:
```R
pd1[1:10,]
     [,1] [,2] [,3]
 [1,]    1  -40  -39
 [2,]    1  -38  -37
 [3,]    1  -38  -37
 [4,]    1  -38  -37
 [5,]    1  -38  -37
 [6,]    1  -39  -37
 [7,]    1  -37  -36
 [8,]    1  -37  -36
 [9,]    1  -37  -36
[10,]    1  -37  -36
```

The first columns is going to correspond to the index of the random walk (they are going to go from ```1``` to ```num_rep```). The other two columns correspond to the persistence diagram of that random walk. (The intervals are repited a couple of times, which makes perfect sense with how are the graphs of this functions and how you compute the persistence homology of the sublevel sets). 

If you look at the output in later rows you will get:
```R
pd1[1005:1015,]
      [,1] [,2] [,3]
 [1,]    4   19   21
 [2,]    4   22   23
 [3,]    4   22   23
 [4,]    4  -19   24
 [5,]    5  -46  -45
 [6,]    5  -43  -42
 [7,]    5  -42  -41
 [8,]    5  -42  -41
 [9,]    5  -42  -41
[10,]    5  -42  -41
[11,]    5  -41  -40
```

In this matrix you can see the last columns of the persistence diagram of the fourth random walk and the first part of the persistence diagram of the next random walk. 
   

#### Computation of the persistence landscape:

To compute the persistence landscapes use the same function ```persistence``` but in this case take the second argument of it. Lets compute the persistence landscaspes of the previous examples:
```R
pl1 <- per_1[[2]]
pl2 <- per_1[[2]]
pl3 <- per_1[[2]]
```

In order to visulaize them you need to use ```PLplot(pl)```. For the previous persistence landscapes you will get:
```R
PLplot(pl1)
PLplot(pl2)
PLplot(pl3)
```
