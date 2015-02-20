shinyUI(pageWithSidebar(
  headerPanel('Morphospace of the Carnivora'),
  sidebarPanel(
    h2("Colours"),
    h5("Blue - Phocids"),
    h5("Green - Mustelids"),
    h5("Red - Canids"),
    h5("Purple - Felids"),
    
    selectInput('xcol', 'X Variable', names(CData)),
    selectInput('ycol', 'Y Variable', names(CData),
                selected=names(CData)[[2]])
    
    ),
  mainPanel(
    plotOutput('PCAPlot')
  )
))

