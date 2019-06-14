#!/usr/bin/env bash
#script using bwa mem to align example trimmed read pair to ref_genome for ecoli
# run as bash alignment.sh


bwa index ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna

bwa mem ~/data/ref_genome/GCA_000017985.1_ASM1798v1_genomic.fna \
~/data/trimmed_fastq_small/sub/SRR2584863_1.trim.sub.fastq \
~/data/trimmed_fastq_small/sub/SRR2584863_2.trim.sub.fastq > ~/results/alignment/SRR2584863.sam
