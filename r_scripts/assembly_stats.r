#assembly statistics for different k for test data and ecoli
library(tidyr)

#read assembly stats (use test data or ecoli if you have it)
assembly_stats <- read.csv("assembly/allteststats", sep="\t")
assembly_stats_ecoli <- read.csv("assembly/ecoli/SRR2584863_all_assembly_stats", sep="\t")

#make sure your table shows the k value so you can plot it
assembly_stats2 <- separate(assembly_stats,n,c("name1","n"), sep=":") %>%
  separate(name1,c("k","name1"),sep="-") %>% separate(k,c("name2","k"),sep="k")
assembly_stats_ecoli2 <- separate(assembly_stats_ecoli,n,c("name1","n"), sep=":") %>%
  separate(name1,c("k","name1"),sep="-") %>% separate(k,c("name2","k"),sep="k")

#some didn't work right
assembly_stats_ecoli2 <- filter(assembly_stats_ecoli2, N50!=0)

#plot N50 and total length as a function of k
ggplot(assembly_stats2,aes(k,N50))+geom_line()+geom_point()
ggplot(assembly_stats_ecoli2,aes(k,N50))+geom_line()+geom_point()
ggplot(assembly_stats_ecoli2,aes(k,sum))+geom_point()
ggplot(assembly_stats_ecoli2,aes(N50,as.integer(n)))+geom_point()
ggplot(assembly_stats_ecoli2,aes(N50,as.integer(n)))+geom_point()+
  geom_smooth(method="lm", se=FALSE)

#there are lots more plots to make
#if you want to communicate all the results effectively use RMarkdown
#install.packages("knitr")
