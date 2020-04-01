library(shiny)
library(kableExtra)
library(rgdal)
library(ggplot2)
library(broom)
source("functions.R")

italy <- readOGR( 
  dsn= paste0("aree/shp"),
  verbose=FALSE
)

Nord <- c("Lombardia","Piemonte","Veneto","P.A. Bolzano","P.A. Trento",
          "Emilia-Romagna","Liguria","Valle d'Aosta","Friuli Venezia Giulia")

italytidy    <- tidy(italy)
italytidy$id <- CovReg[match(italytidy$id, CovReg$codice_regione),
                       "denominazione_regione"]

# TimeSeries ####
Tamponi <- zoo(CovReg$tamponi,
               order.by = CovReg$data)


#res <- xts(CovReg, order.by = CovReg$data)

# Graphics ####
nordgraph <- ggplot(data = CovReg[CovReg$denominazione_regione %in% Nord,], aes(x=data,
                          group = denominazione_regione)) +
  geom_line(aes(y=tamponi)) +
  geom_line(aes(y=nuovi_positivi,
                colour = denominazione_regione )) +
  facet_wrap(.~ denominazione_regione, scales = "free") +
  scale_y_continuous(labels= function(x){FormatNumber(x)}) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.y = element_blank(),
        axis.title.x = element_blank()) +
  labs(color = "Regioni") 

save(nordgraph, file = "data/nordgraph.RData")
