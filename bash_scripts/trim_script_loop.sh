#!usr/bin/env bash
#Script to trim each fastq pair in ~/data/untrimmed_fastq w trimmomatic

for f in ~/data/untrimmed_fastq/*_1.fastq.gz
do
  fastq_folder=$(dirname $f)
  srr=$(basename ${f} _1.fastq.gz)
  trimmomatic PE \
  $f ~/data/untrimmed_fastq/${srr}_2.fastq.gz \
  ~/data/trimmed_fastq/${srr}_1.trim.fastq.gz ~/data/trimmed_fastq/${srr}_1.untrim.fastq.gz \
  ~/data/trimmed_fastq/${srr}_2.trim.fastq.gz ~/data/trimmed_fastq/${srr}_2.untrim.fastq.gz \
  SLIDINGWINDOW:4:20 MINLEN:25 \
  #ILLUMINACLIP:~/.miniconda3/pkgs/trimmomatic-0.38-0/share/trimmomatic-0.38-0/adapters/NexteraPE-PE.fa:2:40:15
done

#trimmomatic PE \
#~/data/untrimmed_fastq/SRR2584863_1.fastq.gz ~/data/untrimmed_fastq/SRR2584863_2.fastq.gz \
#~/data/trimmed_fastq/SRR2584863_1.trim.fastq.gz ~/data/trimmed_fastq/SRR2584863_1.untrim.fastq.gz \
#~/data/trimmed_fastq/SRR2584863_2.trim.fastq.gz ~/data/trimmed_fastq/SRR2584863_2.untrim.fastq.gz \
#SLIDINGWINDOW:4:20 #\
#ILLUMINACLIP:~/.miniconda3/pkgs/trimmomatic-0.38-0/share/trimmomatic-0.38-0/adapters/NexteraPE-PE.fa


