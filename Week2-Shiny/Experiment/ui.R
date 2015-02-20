shinyUI(fluidPage(
    headerPanel("Example"),
    sidebarPanel(
      checkboxGroupInput("variable", "Variable:", choices = names(iris))
    ),
    mainPanel(
      tableOutput("content")
    )
  )) 