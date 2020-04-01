library(shiny)
library(plotly)
library(shinydashboard)

load(paste0("data/",Sys.Date(),"_CovReg.RData"))

variabili = list("Ricoverati Con Sintomi" = "ricoverati_con_sintomi",
                 "Terapia Intensiva" = "terapia_intensiva",
                 "Totale Ospedalizzati"= "totale_ospedalizzati",
                 "Totale Positivi" = "totale_positivi",
                 "Variazione Totale Positivi" = "variazione_totale_positivi",
                 "Nuovi Positivi del Giorno" = "nuovi_positivi",
                 "Dimessi Guariti" = "dimessi_guariti","Deceduti" = "deceduti",
                 "Totale Casi" = "totale_casi", "Tamponi" = "tamponi")

shinyUI(
  dashboardPage(skin = "green",
                dashboardHeader(
                  title = "CoVid_19"),
  dashboardSidebar(
    sidebarMenu(
      br(),
      column(1),
      HTML('<div class="footer">  <font color="grey", size = "4px"> MAIN MENU </font> </div>'),      br(),
      column(1),
      menuItem("Sommario",tabName = "Sommario",
                icon = icon("home")),
      br(),
      column(1),
      menuItem("Sommario2",tabName = "Sommario2",
              icon = icon("poll")))
    
  ),

dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  
  tabItems(
    tabItem(tabName = "Sommario",
            br(),
            fluidRow(column(2,selectInput("regione1","Regione1:",
                        unique(CovReg$denominazione_regione),
                        selected = "Lombardia")),
                     column(2,selectInput("regione2","Regione2:",
                                 unique(CovReg$denominazione_regione),
                                 selected = "Veneto")),
                     column(1),
                     column(3, selectInput("variabile","Dato:",
                                           variabili,
                                           selected = "Tamponi")),
                     column(1),
                     column(2,
                     h5(paste0("Dati aggiornati a ", max(as.Date(CovReg$data)))))),
            br(),
            br(),
            br(),
            fluidRow(column(1),column(10,plotlyOutput("situanord"))
            )
            )
  )
  )
)
)

