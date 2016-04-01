minx <- min(movies$rating)
maxx <- max(movies$rating)

shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    size <- (maxx - minx) / input$bins
    
#     gg <- ggplot(movies, aes(x=rating)) +
#       geom_histogram(aes(y = ..density..), binwidth=size)
#     # Convert the ggplot to a plotly
#     p <- ggplotly(gg)
#     p
    
    
    outfile <- tempfile(fileext='.png')
    
    # Generate the PNG
    png(outfile, width=400, height=300)
    gg <- ggplot(movies, aes(x=rating)) +
      geom_histogram(aes(y = ..density..), binwidth=size)
    p <- ggplotly(gg)
    dev.off()
    p
  })
})