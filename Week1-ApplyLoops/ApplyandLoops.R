#Example 1
MyVec<-NULL
MyMat<-matrix(rnorm(1000000), 10000)

system.time(
for(i in 1:nrow(MyMat)){
	
	MyVec[i]<-sum(MyMat[i, ])
	
})


system.time(apply(MyMat,1,sum))



#Example 2
A<-seq(1,1000,1)
B<-A

Tables<-matrix(data=NA, ncol=length(A), nrow=length(B))


system.time(
  for(i in 1:length(A)){
    
    for(j in 1:length(B)){
      
      Tables[i,j]<-i*j
      
    }	
       
  }
)

#Using Outer
system.time(outer(seq(1,1000,1), seq(1,1000,1), FUN = "*"))


#Example 3
#Makes list of matricies
S <- 3000
Sims <- Map(function(x) matrix(rnorm(25), nrow=5, ncol=5), 1:S)


#Apply function
system.time(
do.call(rbind, lapply(Sims, function(x) rowSums(x)))
)

#Loop
SumSims<-matrix(NA, nrow=length(Sims), ncol=ncol(Sims[[1]]))

system.time(

for(i in 1:length(Sims)){
	
	for(j in 1:nrow(Sims[[i]])){
	
	SumSims[i,j]<-sum(Sims[[i]][j, ])
	
	}
}
)