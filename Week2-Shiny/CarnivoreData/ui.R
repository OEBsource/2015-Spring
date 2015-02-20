shinyUI(pageWithSidebar(
  headerPanel("Carnivore Morphospace"),
  
  sidebarPanel(
    h2("Colours"),
    
  
  selectInput('xcol', 'X Variable', names(CData),
              selected=names(CData)[[6]]),
  selectInput('ycol', 'Y Variable', names(CData),
              selected=names(CData)[[7]])
              ),
  
  mainPanel(
    plotOutput('PCAPlot')
    )
  
))