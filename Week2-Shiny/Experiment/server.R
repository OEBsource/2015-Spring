library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

  output$content <- renderTable({
    if(is.null(input$variable))
      return()
    
    iris[input$variable]
  })
})