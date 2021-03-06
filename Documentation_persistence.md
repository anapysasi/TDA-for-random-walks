# Documentation: persistence

## Topological Data Analysis of Random functions (Random walks)
### Author: Ana Pilar Ysasi Cillero 


## Previous Installations

The pacakes used to compute the perisistence diagram and the persistence landscapes require a previous installation. 

For detailed information about this package, installation and use, go to <https://github.com/jjbouza/tda-tools>.

After downloading this package you should be ready to use this functuion without problems.


## Installations

Clone the github repo either using git clone <https://github.com/anapysasi/TDA-for-random-walks.git> or just download from Github using the green button.


## Persistence diagram and landscape

The function is going to generate N different random walks and then compute the persistence diagram of each one, and finally, compute then the average of all the persistence landscapes.

## INPUTS:

1. __num_rep__: number of random walks in each trial
2. __T__: number of steps in the random walk
3. __random_type__: choices between ```"Bernoulli"``` andn ```"Normal_dist"``` (Notice that they must be in between "")
4. __return2zero__: Boolean Argument. If you want your random walk to start and finish in zero, set as TRUE
5. __p__: If ```random_type = "Bernoulli"``` you can add the probability. The default value is ```p=0.5```


### Persistence diagram

The first output of the function ( ```persistence(num_rep, T, random_type ,return2zero, p = 0.5)[[1]]``` ) correspond to the different persistence diagrams. 

This is going to consist in a matrix with three columns. The first one is going to be the index of the random walk and the other two colums are going to be the birth and the death of the different intervals.

```R
# Lets compute the persistence diagram of a hundred random walks each one with a hundred step, with a Bernouilli distribution (p=0.5)
pd <- persistence(num_rep = 100, T = 100, random_type = "Bernoulli", return2zero = FALSE)[[1]]
pd[1:20,]
      [,1] [,2] [,3]
 [1,]    1   -6   -4
 [2,]    1   -4   -3
 [3,]    1   -4   -3
 [4,]    1   -4   -3
 [5,]    1   -3   -2
 [6,]    1   -3   -2
 [7,]    1   -3   -2
 [8,]    1   -3   -2
 [9,]    1   -3   -2
[10,]    1   -5   -2
[11,]    1   -2   -1
[12,]    1   -2   -1
[13,]    1   -2   -1
[14,]    1   -2   -1
[15,]    1   -1    0
[16,]    1    0    1
[17,]    1    0    1
[18,]    1    0    1
[19,]    1   -1    1
[20,]    1    1    2
```


### Persistence landscape

The second output of the function ( ```persistence(num_rep, T, random_type ,return2zero, p = 0.5)[[2]]``` ) correspond to the average of all the persistence landscapes (normalize to the number of random walks). 
```R
# Lets compute the persistence landscape of a thousand random walks each one with a hundred step, with a Bernouilli distribution (p=0.5)
PLplot(persistence(num_rep = 1000, T = 100, random_type = "Bernoulli", return2zero = FALSE)[[2]]) 
```
