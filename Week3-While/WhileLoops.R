setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2015-Spring/Week3-While")

#While
RandVec<-rnorm(1000)
RandMat<-matrix(Test,100,10)

n <- dim(RandMat)[1]
i <- 1
output <- NULL

while(i < n){
  
  coordinates <- seq(i, i+9, 1)
  output<- c(output, coordinates)
  
  i <- i + 20
  
}

RandFinal<-RandMat[output,]

#ifelse
Lizs<-read.csv("anolisData.csv", na.strings="?", row.names=1)

LizsRed<-Lizs[Lizs$Island=="Cuba" | Lizs$Island=="Hispaniola",]


LizVar<- function(X1, Islands) {
  ifelse (Islands == "Cuba",
  D1 <- X1[X1$Island == "Cuba",],
  D1 <- X1[X1$Island == "Hispaniola",])
    as.data.frame(D1)
}

LizVar(LizsRed, "Cuba")

#
Anolis <- read.csv("anolisSample.csv", row.names=1)
head(Anolis)

Index.function <- function(Spec,Choice1){
if (Choice1 == "Richness") {
  Index <- rowSums(Spec > 0, na.rm = TRUE)
    } else
if (Choice1 == "Total Abundance") {
  Index <- rowSums(Spec, na.rm = TRUE)
    } else
if (Choice1 == "Shannon") {
  RS <- rowSums(Spec, na.rm = TRUE)
  prop <- Spec / RS
  Index <- -rowSums(prop*log(prop),na.rm=TRUE)
  }
    else {
    print("Check your choice")
    Index <- NA
      }
list(Index = Index, MyChoice = Choice1)
}


#Let's get it wrong first by not capitalising the entries...
Index.function(Anolis, "total abundance")
#...then correct it here.
Index.function(Anolis, "Total Abundance")