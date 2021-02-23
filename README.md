# Polygonia calbum genome and annotation #

Release 23 February 2021

Associated Publication
in review

reference needed here. Link below needs updating once established

- [link to article](https://www.nature.com/articles/s41467-019-13596-2)

***************************************

### Contents ###

+ A. Genome files
+ B. Bioinformatic scripts


***************************************

### A. Genome assembly files  ###


+ `Pcalbum_chromosome_and_unplaced.naf` — final genome assembly with chromosomes and unplaced scaffolds. This is compressed in Nucleotide Archival Format (NAF).
- [link to website](https://github.com/KirillKryukov/naf)
- [link to article](https://academic.oup.com/bioinformatics/article/35/19/3826/5364265)

+ `Pcalbum_chromosome_and_unplaced.gff` - show results from running assemblathon_stats.pl, from the Assemblathon 2 competition (https://github.com/ucdavis-bioinformatics/assemblathon2-analysis), on the pre and post scaffolded geomes.


***************************************

### C. File Listing ###

The CEGMA distribution contains the following files and directories:

+ `Colias_crocea_editTrinity.okay.aa.gz` — The predicted protiens from running Evigene on Trinity transcriptome assembly.
+ `Colias_crocea_genome_V1.fa.gz` — The AllPaths and PacBio merged assembly prior to scaffolding.
+ `Colias_crocea_genome_V1_mespa_scaffolded.fa.gz` — The protein scaffolded version of the V1 genome.
+ `Colias_crocea_genome_V1_mespa_scaffolded.gff.gz` — The annotation of the scaffolded genome using the evigene proteins above.
+ `Colias_crocea_genome_V1_mespa_scaffolded.fa_cds.fa.gz` — 19404 CDS sequences from GFF and genome.
+ `Colias_crocea_genome_V1_mespa_scaffolded.fa_prot.fa.gz` — 19404 protein sequences from GFF and genome.
+ `README.md` — This file.
