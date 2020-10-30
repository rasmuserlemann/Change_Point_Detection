# Code used in the power study and an example in the paper *Cramer-von Mises Tests for Change Points*
The code is written in R. It was written in collaboration with Prof. Richard Lockhart

## Test statistics wmax and wbar
blabla

## WmaxWhichC
blabla

## Setup
To run the power simulations, choose the alternative. Alternative can be adjusted inside the function body. For the example, it is 
```
d = c(rgamma(as.integer(0.4*n), shape = 1, scale = 2), rnorm(as.integer(0.2*n), 2, 3))
d = c(d, rgamma(as.integer(0.4*n), shape = 1, scale = 2))
```
In other words, first 40 percent of the sample comes from Gamma(1,2). next 20 percent comes from N(2,3) and the last 40 percent come from Gamma(1,2) again.