#### Dati
##### Read dataset Nazionale
dsets  <- list.files("dati-andamento-nazionale")
CovNaz <- read.csv(paste0("dati-andamento-nazionale/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovNaz <- rbind.data.frame(CovNaz,
                             read.csv(paste0("dati-andamento-nazionale/",
                                             dsets[i])))
  
}

save(CovNaz, file = paste0("data/",Sys.Date(),"_CovNaz.RData"))

##### Read dataset Provinciale
dsets  <- list.files("dati-province")
CovPrv <- read.csv(paste0("dati-province/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovPrv <- rbind.data.frame(CovPrv,
                             read.csv(paste0("dati-province/",
                                             dsets[i])))
}

save(CovPrv, file = paste0("data/",Sys.Date(),"_CovPrv.RData"))

##### Read dataset Regioni
dsets  <- list.files("dati-regioni")
CovReg <- read.csv(paste0("dati-regioni/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovReg <- rbind.data.frame(CovReg,
                             read.csv(paste0("dati-regioni/",
                                             dsets[i])))
}

CovReg$denominazione_regione <- as.character(CovReg$denominazione_regione)
CovReg$data                  <- as.Date(CovReg$data)

save(CovReg, file = paste0("data/",Sys.Date(),"_CovReg.RData"))

#### Regioni starting from 1 

covreg1 <- CovReg[CovReg$totale_positivi>10,]
covreg1_data <- covreg1 %>% 
  group_by(denominazione_regione) %>%
  mutate(data1 = seq(1:length(data)))

save(covreg1_data, file = paste0("data/",Sys.Date(),"_CovReg1.RData"))
