# Code used in the power study and an example in the paper *Cramer-von Mises Tests for Change Points*
The code is written in R. It was written in collaboration with Prof. Richard Lockhart

## Test statistics wmax and wbar
Both wmax and wbar are based on the two-sample Cramer-von Mises test statistic. With wbar, we put the change point c=1,2,...,n-1 and then sum all these test statistic values together. With wmax, instead of summing, we take the maximum value of these test statistic values. Large values of the test statistics suggest that there is a change point somewhere in the data. Wmax can also be used to detect the change point location, by finding the index c, where it achieved the maximum.

## WmaxWhichC
This program was written to visualize one of the hypotheses in the paper. It plots the distribution of the change points.

## Setup
To run the power simulations, choose the alternative. Alternative can be adjusted inside the function body. For the example, it is 
```
d = c(rgamma(as.integer(0.4*n), shape = 1, scale = 2), rnorm(as.integer(0.2*n), 2, 3))
d = c(d, rgamma(as.integer(0.4*n), shape = 1, scale = 2))
```
In other words, the first 40 percent of the sample comes from Gamma(1,2). the next 20 percent comes from N(2,3) and the last 40 percent come from Gamma(1,2) again.