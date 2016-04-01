minx <- min(movies$rating)
maxx <- max(movies$rating)

shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    size <- (maxx - minx) / input$bins
    
    gg <- ggplot(movies, aes(x=rating)) +
      geom_histogram(aes(y = ..density..), binwidth=size)
    # Convert the ggplot to a plotly
    p <- ggplotly(gg)
    p
  })
})