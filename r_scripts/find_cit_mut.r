#install dplyr, tidyr, ggplot2
#install.package(c("dplyr","tidyr","ggplot2"))
#load libraries
library(dplyr)

#load variant data for all individuals
#if you didn't do this use ~/r_data/combined_tidy_vcf.csv
variants <- read.csv("~/r_data/combined_tidy_vcf.csv")

#load information about ecoli / strains (mine is in data_info)
ecoli_metadata <- read.csv("data_info/Ecoli_metadata_composite.csv")

#put together variant information and citrate information (hint: left_join)
variants_w_cit <- left_join(variants,ecoli_metadata, by = c("sample_id" = "run"))

#count the number of mutations for each sample and know which is cit+
variants_w_cit %>% group_by(sample_id,cit) %>% tally
