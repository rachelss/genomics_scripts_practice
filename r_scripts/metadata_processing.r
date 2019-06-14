#install.packages("dplyr")
library(dplyr)

#look at Ecoli metadata - count number of cit+ individuals
ecoli <- read.csv("data_info/Ecoli_metadata_composite.csv")
ecoli %>% count(cit)
