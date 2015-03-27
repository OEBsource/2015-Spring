setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2015-Spring/Week4-For")

Adam<-read.csv("19Feb2015_P7_CTRL3_cor.csv")

#Input your X vector, your y vector, and the threshold level to detect a spike.
  #The default is set to a change of 0.12 degrees over one reading.
SuperKool<-function(X, Y, Threshold=0.12){
  #set up for 2 different plots. A raw plot and one with the lines
  par(mfrow=c(1,2))
      plot(X,Y, type='l')
      
      #Determine the threshold for picking up spikes
      #Often there will be multiple spikes, so you may have to change your threshold level.
      Vectors<-NULL
      for(i in 1:length(Y)){
        Vectors[i]<-abs(abs(Y[i])-abs(Y[(i+1)]))>=Threshold
      }
      
      #Automatically adjusting the number of spike lines.
      #sum(Vectors, na.rm=T)<=3
      
      
      #abs(Adam[Vectors,1][1]-Adam[Vectors,1][2])>1
      
      #Locate the most likely position of the spike
      i<-1
      while(abs(X[Vectors][i]-X[Vectors][(i+1)])>1){
        i<-i+1
        
      }
      
      #Plot with the lines showing where potential spikes are located 
      plot(X, Y, type='l')
      abline(v=X[Vectors][i], col="red")
      
      #Record the spike temperature.
      #Note that this is the temperature prior to spike - If want spike then need [(i+1)]
      Temps<-Y[Vectors][i]
      SpikeTemps<-Y[Vectors][(i+1)]
      
    #Outputs
  Tempvectors<-c(Temps, SpikeTemps)
  names(Tempvectors)<-c("Temperature before spike", "Temperature spike")
  Tempvectors
}


SuperKool(Adam[,1],Adam[,6],0.12)










###Notes for setting this up###
SuperKool<-function(X, Y, Threshold=0.12)
  #set up for 2 different plots. A raw plot and one with the lines
  par(mfrow(c(1,2))
      plot(Adam[,1],Adam[,5], type='l')
      
      #Determine the threshold for picking up spikes
      #Often there will be multiple spikes, so you may have to change your threshold level.
      Vectors<-NULL
      for(i in 1:length(Adam[,3])){
        Vectors[i]<-abs(abs(Adam[i,3])-abs(Adam[(i+1),3]))>=.12
      }
      
      #Automatically adjusting the number of spike lines.
      #sum(Vectors, na.rm=T)<=3
      
      
      #abs(Adam[Vectors,1][1]-Adam[Vectors,1][2])>1
      
      #Locate the most likely position of the spike
      i<-1
      while(abs(Adam[Vectors,1][i]-Adam[Vectors,1][(i+1)])>1){
        i<-i+1
        
      }
      
      #Plot with the lines showing where potential spikes are located 
      plot(Adam[,1],Adam[,3], type='l')
      abline(v=Adam[Vectors,1][i])
      
      #Record the spike temperature.
      #Note that this is the temperature prior to spike - If want spike then need [(i+1)]
      Temps<-Adam[Vectors,3][i]
      SpikeTemps<-Adam[Vectors,3][(i+1)]
      
      list(Temps,SpikeTemps)
