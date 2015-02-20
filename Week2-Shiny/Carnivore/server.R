library(shiny)
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2015-Spring/Week2-Shiny/Carnivore")
CData<-read.csv("PlacentalScoresSHINY.csv")
CData[,2]<-as.factor(CData[,2])

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3"))

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    CData[, c(input$xcol, input$ycol)]
  })
  
  
  
  output$PCAPlot <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col=unclass(CData$Group),
         pch = 20, cex = 3)
  })
  
})