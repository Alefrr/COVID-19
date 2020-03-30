library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)

shinyServer(function(input, output, server){
  
  load("data/nordgraph.RData")
  
  output$situanord <- plotly::renderPlotly({
    
    ggplotly(nordgraph) %>%
      layout(         annotations = list(text = 'Tamponi & Positivi Totali',
                                         font = list(size = 14),
                                         showarrow = FALSE,
                                         xref = 'paper', x = -0.10,
                                         yref = 'paper', y = 0.81,
                                         textangle = -90))
    
  })
})