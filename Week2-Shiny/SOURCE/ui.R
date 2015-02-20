shinyUI(fluidPage(
        #fluidPage means you want everything to match the size of your window
  titlePanel("Two SOURCE Widgets"),
    fluidRow(
      
      #Widgets - the things the user controls
      #Widgets needs two things
        #1, Widget name - drop down menu, slider etc.
        #2, Label
      
      #Column - how big do you want the widgets
      column(3,
             #Widget 1 - select input
             
             selectInput("select", label=h3("Select box"),
                         choices=list("Andy's 1" = 1, "Klean 2" = 2,
                                      "Shiny 3" = 3),
                         
                         selected = 3)),
      
      column(3,
             
             #Sliders - There are two types of sliders
             sliderInput("slider 1", label =h3 ("One way slider"),
                         min=0, max=100, value=50),
             #'Value' is the default input
             #Slider 2 needs two inputs as it can slide two ways
             sliderInput("slider2", label=h3("Two way slider"),
                         min=0, max=100, value=c(25,75))
                         
      )
    )
))
             