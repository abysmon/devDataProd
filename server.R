library(dygraphs)
library(datasets)

shinyServer(function(input, output) {

  loessTS <- stl(AirPassengers, s.window = 'periodic')
  lts <- cbind(loessTS$time.series, AirPassengers)

  predicted <- reactive({
    ap.hw <- HoltWinters(AirPassengers)
    p <- predict(ap.hw, n.ahead = input$months, 
            prediction.interval = TRUE,
            level = as.numeric(input$interval))
    full <- cbind(AirPassengers, p)
    })
  
  output$original <- renderDygraph({
    dygraph(lts[,4], "Monthly international airline passengers") %>%
      dyAxis("x", pixelsPerLabel = 50, drawGrid = FALSE) %>%
      dyAxis("y", label = "Passengers (Thousands)") %>%
      dyOptions(axisLineColor = "maroon", gridLineColor = "white", includeZero = T) %>%
      dyOptions(colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
      dyRangeSelector()
  })

  output$Trend <- renderDygraph({
    dygraph(lts[,2], "Trend Component")%>%
      dyAxis("x", pixelsPerLabel = 50, drawGrid = FALSE) %>%
      dyAxis("y", label = "Passengers (Thousands)") %>%
      dyOptions(gridLineColor = "lightblue", colors = 'maroon', drawPoints = T, includeZero = T) %>%
      dyRangeSelector()
  })

  br()

  output$Seasonal <- renderDygraph({
    dygraph(lts[,1], "Seasonal Component")%>%
      dyAxis("x", pixelsPerLabel = 50, drawGrid = FALSE) %>%
      dyAxis("y", label = "Passengers (Thousands)") %>%
      dyOptions(gridLineColor = "lightblue", colors = 'green', includeZero = T) %>%
      dyRangeSelector()
  })

  br()

  output$Residuals <- renderDygraph({
    dygraph(lts[,3], "Residuals")%>%
      dyAxis("x", pixelsPerLabel = 50, drawGrid = FALSE) %>%
      dyAxis("y", label = "Passengers (Thousands)") %>%
      dyOptions(gridLineColor = "lightblue", colors = 'dodgerblue', includeZero = T) %>%
      dyRangeSelector()
  })

  output$predict <- renderDygraph({
    dygraph(predicted(), "Predicted Monthly international airline passengers") %>%
      dySeries("AirPassengers", label = "Actual") %>%
      dyAxis("y", label = "Passengers (Thousands)") %>% 
      dySeries(c("p.lwr", "p.fit", "p.upr"), label = "Predicted") %>%
      dyAxis("x", pixelsPerLabel = 50, drawGrid = FALSE) %>%
      dyOptions(colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
      dyRangeSelector()
  })

})
