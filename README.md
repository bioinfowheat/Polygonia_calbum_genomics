# Polygonia calbum genome and annotation #

Release 23 February 2021

Associated Publication
in review

reference needed here. Link below needs updating once established

- [link to article](https://www.nature.com/articles/s41467-019-13596-2)

***************************************

### Contents ###

+ A. Genome assembly files
+ B. Bioinformatic scripts



***************************************

### A. Genome assembly files  ###


***************************************

### A. Annotation ###

We are using the proteins identified in our transcriptome assembly (Trinity), after collapsing the assembly using the tool Evigene. The raw RNAseq reads for the transcriptome assembly are on NCBI, here:

- [link to RNAseq dataset](https://www.ncbi.nlm.nih.gov/nuccore/GIBK00000000#feature_GIBK00000000.1)

and the identified proteins are listed below.

***************************************

### Assessments ###

+ `annotation.sh` — shows the steps for generating the annotation, as well as results.
+ `genome_stats.sh` - show results from running assemblathon_stats.pl, from the Assemblathon 2 competition (https://github.com/ucdavis-bioinformatics/assemblathon2-analysis), on the pre and post scaffolded geomes.
+ `transcriptome_assembly_proteins.sh` - shows summary stats on the protein file used for scaffolding and annotation.

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
