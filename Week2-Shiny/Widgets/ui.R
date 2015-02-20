shinyUI(fluidPage(
  titlePanel("Two widgets"),
  #fluid row just means that upon launching the app the your widget will match the size
  #of your browser window.
  fluidRow(
    #The widget requires two components, 1, Widget name and 2, Widget label
    #Because I want to show two widgets at once I need to specify that they sit in separate column.
    #The number '3' indicates how wide I want the column to be.
    column(3,
           #Here the widget name is selectInput - "Select", and I will label it "Select box".
           selectInput("select", label = h3("Select box"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      #selected indicates your default when you launch the app.
                                      "Choice 3" = 3), selected = 1)),
    
    column(3, 
           #There are two different slider widgets, a one way and two way
           #The h3 is similar to a html command in that it controls how the text looks.
           sliderInput("slider1", label = h3("One way slider"),
                       min = 0, max = 100, value = 50),
           sliderInput("slider2", label = h3("Two way slider"),
                       #Value indicates your default when you launch the app.
                       min = 0, max = 100, value = c(25, 75))
    )
  )
))