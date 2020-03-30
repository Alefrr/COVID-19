#### Dati
##### Read dataset Nazionale
dsets  <- list.files("dati-andamento-nazionale")
CovNaz <- read.csv(paste0("dati-andamento-nazionale/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovNaz <- rbind.data.frame(CovNaz,
                             read.csv(paste0("dati-andamento-nazionale/",
                                             dsets[i])))
  
}

save(CovNaz, file = "data/300320_CovNaz.RData")

##### Read dataset Provinciale
dsets  <- list.files("dati-province")
CovPrv <- read.csv(paste0("dati-province/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovPrv <- rbind.data.frame(CovPrv,
                             read.csv(paste0("dati-province/",
                                             dsets[i])))
}

save(CovPrv, file = "data/300320_CovPrv.RData")

##### Read dataset Regioni
dsets  <- list.files("dati-regioni")
CovReg <- read.csv(paste0("dati-regioni/",dsets[1]))

for (i in seq(2,length(dsets))) {
  
  CovReg <- rbind.data.frame(CovReg,
                             read.csv(paste0("dati-regioni/",
                                             dsets[i])))
}

save(CovReg, file = "data/300320_CovReg.RData")