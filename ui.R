library(shiny)
shinyUI(fluidPage(
    titlePanel("Analysis of infert data"),
    sidebarLayout(
        sidebarPanel(
            h1("Define woman age"),
            sliderInput("slider2","Number of years", 21, 44, 30),
            checkboxInput("showModel1", "Show/Hide predicted parities", value = TRUE),
            checkboxInput("showModel2", "Show/Hide predicted induced and spontaneous abortions", value = TRUE)
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Number of predicted parities"),
            textOutput("pred1"),
            h3("Number of predicted induced and spontaneous abortions"),
            textOutput("pred2")
        )
    )
))
