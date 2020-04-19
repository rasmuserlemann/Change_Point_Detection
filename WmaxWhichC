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
  return(which(w.vec==max(w.vec)))
}

distr = c()
vvv = 10000
for (ooo in 1:vvv){
  #data
  n = 50
  d = rgamma(as.integer(0.3*n), shape = 1, scale = 2)
  d = c(d, rgamma(as.integer(0.3*n), shape = 2, scale = 3))
  d = c(d, rgamma(as.integer(0.4*n), shape = 3, scale = 4))
  distr = c(distr, wmax(d)/n)
}

#Which c did wmax choose?
hist(distr)
