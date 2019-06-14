#for loop through each file
#get rid of extension using basename
#move file (current file name = $f) to output from above followed by _2019.txt

install.packages("dplyr")
library(dplyr)
#look at Ecoli metadata
ecoli <- read.csv("data_info/Ecoli_metadata_composite.csv")
ecoli %>% count(cit)
