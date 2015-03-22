require(dygraphs)
require(shiny)

shinyUI(fluidPage(
  
  titlePanel("Monthly international airline passengers"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("months", label = "Months to forecast", min = 12, 
                  max = 60, value = 24, step = 6),
      selectInput("interval", label = "Prediction Interval",
                  choices = c("0.80", "0.90", "0.95", "0.99"),
                  selected = "0.95"),
      submitButton(text = "Update")
    ),
    mainPanel(
      tabsetPanel(type = "tabs",                   
                  tabPanel("Description", pre(includeText("summary.txt"))),
                  tabPanel("Original data", dygraphOutput("original")), 
                  tabPanel("Time Series decomposition", 
                           dygraphOutput("Trend"), 
                           br(),
                           dygraphOutput("Seasonal"),
                           br(),
                           dygraphOutput("Residuals")),
                  tabPanel("Forecast", dygraphOutput("predict"))
      )
    )
  )
))
