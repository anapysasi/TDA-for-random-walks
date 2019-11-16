# Lets compute the persistence landscapes for different random functions

### WIENER PROCESS
# Normal_dist not rotated
num_rep <- 1000
T = 1000
random_type = "Normal_dist"
return2zero = FALSE 

pl_Wiener <- persistence(num_rep, T , random_type , return2zero)[[2]]
PLplot(pl_Wiener)

# Normal_dist rotated BROWNIAN BRIDGE
num_rep <- 1000
T = 1000
random_type = "Normal_dist"
return2zero = TRUE 

pl_Brow_Bridge <- persistence(num_rep, T , random_type , return2zero)[[2]]
PLplot(pl_Brow_Bridge)

############################# RANDOM WALKS #############################
### BERNOULLI NOT ROTETED
# Bernoulli p=0.5
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = FALSE
p=0.5

pl5 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl5)

# Bernoulli p=0.4
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = FALSE
p=0.4

pl4 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl4)

# Bernoulli p=0.3
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = FALSE
p=0.3

pl3 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl3)

# Bernoulli p=0.2
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = FALSE
p=0.2

pl2 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl2)

# Bernoulli p=0.1
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = FALSE
p=0.1

pl1 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl1)

##########################################################
### BERNOULLI ROTETED
# Bernoulli p=0.5
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = TRUE
p=0.5

pl51 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl51)

# Bernoulli p=0.4
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = TRUE
p=0.4

pl41 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl41)

# Bernoulli p=0.3
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = TRUE
p=0.3

pl31 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl31)

# Bernoulli p=0.2
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = TRUE
p=0.2

pl21 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl21)

# Bernoulli p=0.1
num_rep <- 1000
T = 1000
random_type = "Bernoulli"
return2zero = TRUE
p=0.1

pl11 <- persistence(num_rep, T , random_type , return2zero , p )[[2]]
PLplot(pl11)
