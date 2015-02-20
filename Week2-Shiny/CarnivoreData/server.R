setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2015-Spring/Week2-Shiny/CarnivoreData")
CData <- read.csv("PlacentalScoresSHINY.csv")

CData[,2] <- as.factor(CData[,2])

library(shiny)

shinyServer(function(input,output){
 
  selectedData <- reactive({
    CData[,c(input$xcol, input$ycol)]
    
  })
  
  output$PCAPlot<-renderPlot({
    
    plot(selectedData(),
         col=unclass(CData$Group),
         pch=20, cex=3)
    
  })
  
  
})