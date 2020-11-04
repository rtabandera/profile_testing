remotes::install_github("noaa-edab/ecodata",build_vignettes=TRUE)
library(tidyverse)
# Loading the bottom traw data from NEFCS simplified into guilds
trawl_survey<-ecodata::nefsc_survey
# Selecting out only the fall benthivore data 
benthivore_fall<-subset(trawl_survey, Var=="Benthivore Fall Biomass Index")
benthivore_stock<-benthivore_fall %>% group_by(EPU)%>%  summarise(EPU_mean = mean(Value))




ggplot(benthivore_fall, aes(x=Time, y= Value))+
  geom_point()