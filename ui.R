library(shiny)
library(plotly)
library(shinydashboard)


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
            br(),
            br(),
            fluidRow(column(1),column(10,plotlyOutput("situanord"))
            )
            )
  )
  )
)
)

