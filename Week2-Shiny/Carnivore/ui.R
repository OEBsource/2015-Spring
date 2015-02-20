shinyUI(pageWithSidebar(
  headerPanel('Morphospace of the Carnivora'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(CData)),
    selectInput('ycol', 'Y Variable', names(CData),
                selected=names(CData)[[2]])
    
    ),
  mainPanel(
    plotOutput('PCAPlot')
  )
))

