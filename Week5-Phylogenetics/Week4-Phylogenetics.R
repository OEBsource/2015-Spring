#Week 5 Phylogenetics#
require(geiger); require(phytools)
setwd("~/Dropbox/Amherst/Courses/SOURCE/2015-Spring/Week5-Phylogenetics")

#What do trees look like
TREE <- "(((TaxonA:4,TaxonB:4):3,TaxonC:7):5,TaxonD:12);"
TREE
My.Tree <- read.tree(text = TREE)
plot(My.Tree)
axisPhylo()

#How is R seeing our tree?
class(My.Tree)
#Should be as a phylo

My.Tree
str(My.Tree)

My.Tree$edge

#We can visualize how these nodes and tips are connected by plotting them.
nodelabels()
tiplabels()


#Let's read in our own tree
Tr<-read.nexus("CarnivoraCon.nex")
plot(Tr)

plot(ladderize(Tr), cex=0.1)
axisPhylo()

Tr
#contains polytomies - 252 - 246
Tr<-multi2di(Tr)
#Add 100,000 years to the 0 branch lengths
Tr$edge.length[Tr$edge.length == 0] <- 0.0000001
#contains polytomies - 252 - 251 - Yeah!

#Read in some data and the 'prune the tree'
  #Must have row names that match the tips in your tree
Can<-read.csv("CanDat.csv", row.names=1)

Pruning<-treedata(Tr, Can)

#Two list elements are contained in Pruning
  #The pruned tree, and the pruned data
Ctree<-Pruning$phy
CTree<-ladderize(Ctree)
CData<-Pruning$data

CData <- CData[match(CTree$tip.label, rownames(CData)),]

CData<-as.data.frame(CData)

#Sometimes it makes all your data factor data.
  #Not sure why.
str(CData)

for(i in 5:ncol(CData)){
CData[,i]<-as.numeric(as.character(CData[,i]))
}

str(CData)

#Ploting data
phylomorphospace(CTree, CData[,7:8], label="off")
points(CData[,7:8], col=unclass(CData$Diet), pch=20)

#MANOVA
dats<-CData[,7:8]
Grp<-CData[,4]

MusMANOVA<-aov.phylo(dats~Grp, CTree, nsim=50, test="Wilks")

#Evo models
