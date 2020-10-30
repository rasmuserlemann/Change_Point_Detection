wbar = function(x){
  n=length(x)
  MD=outer(x,x,"-")
  MD[MD>=0]=1
  MD[MD<0]=0
  N=matrix(0,nrow=n,ncol=n-1)
  I=1:n
  Cee=1:(n-1)
  ND=outer(I,Cee,"-")
  N[ND <= 0]=1
  One.n = rep(1,n)
  One.nm1 = rep(1,n-1)
  F.mat=MD%*%N*outer(One.n,1/Cee)
  G.mat=MD%*%(1-N)*outer(One.n,1/(n-Cee))
  MR = outer(One.n,Cee*(n-Cee))
  sum(MR*(F.mat-G.mat)^2)/(n^2*(n-1))
}
wmax = function(x){
  n=length(x)
  MD=outer(x,x,"-")
  MD[MD>=0]=1
  MD[MD<0]=0
  N=matrix(0,nrow=n,ncol=n-1)
  I=1:n
  Cee=1:(n-1)
  ND=outer(I,Cee,"-")
  N[ND <= 0]=1
  One.n = rep(1,n)
  One.nm1 = rep(1,n-1)
  F.mat=MD%*%N*outer(One.n,1/Cee)
  G.mat=MD%*%(1-N)*outer(One.n,1/(n-Cee))
  MR = outer(One.n,Cee*(n-Cee))
  w.vec=apply(MR*(F.mat-G.mat)^2/n^2,2,sum)
  max(w.vec)
}

powermax = function(n, sig, testsim, powersim){
  
  #Test statistic distribution
  C = c()
  for (pp in 1:testsim){
    s = runif(n)
    C[pp] = wmax(s)
   } 

  count2 = 0

  for (ooo in 1:powersim){
  #we draw a sample from the alternative distribution
    d = c(rgamma(as.integer(0.4*n), shape = 1, scale = 2), rnorm(as.integer(0.2*n), 2, 3))
    d = c(d, rgamma(as.integer(0.4*n), shape = 1, scale = 2))
    obs = wmax(d)
    condpvalue = length(C[C > obs])/length(C)
    if (condpvalue < sig){
      count2 = count2 + 1
    }
  }
return(count2/powersim)
}
powerbar = function(n, sig, testsim, powersim){
  
  #Test statistic distribution
  C = c()
  for (pp in 1:testsim){
    s = runif(n)
    C[pp] = wbar(s)
  } 
  
  count2 = 0
  
  for (ooo in 1:powersim){
    #we draw a sample from the alternative distribution
    d = c(rgamma(as.integer(0.4*n), shape = 1, scale = 2), rnorm(as.integer(0.2*n), 2, 3))
    d = c(d, rgamma(as.integer(0.4*n), shape = 1, scale = 2))
    obs = wbar(d)
    condpvalue = length(C[C > obs])/length(C)
    if (condpvalue < sig){
      count2 = count2 + 1
    }
  }
  return(count2/powersim)
}
print(powermax(100, 0.1, 1000, 1000))
