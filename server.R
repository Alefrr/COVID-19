library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)

load(paste0("data/",Sys.Date(),"_CovReg.RData"))
load("data/nordgraph.RData")
source("functions.R")

shinyServer(function(input, output, server){

  
  output$situanord <- plotly::renderPlotly({
    
    regplt1 <- input$regione1
    regplt2 <- input$regione2
    varint1  <- input$variabile
    
    covregplot <- CovReg[CovReg$denominazione_regione %in% c(regplt1,regplt2),]
    
    (ggplot(data = covregplot, aes(x = data)) +
      geom_line(aes_string(y=varint1,
                    colour = "denominazione_regione")) +
      scale_y_continuous(labels= function(x){FormatNumber(x)}) + 
      scale_x_date(date_breaks = "months" , date_labels = "%d-%b-%y") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            axis.title.y = element_blank(),
            axis.title.x = element_blank()) +
      labs(color = "Regioni")) %>%
      ggplotly() #  %>%
      # layout(annotations = list(text = 'Tamponi & Positivi Totali',
      #                           font = list(size = 14),
      #                           showarrow = FALSE,
      #                           xref = 'paper', x = -0.09,
      #                           yref = 'paper', y = 0.81,
      #                           textangle = -90))
  
  })
})