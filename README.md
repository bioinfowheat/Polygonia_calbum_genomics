# Polygonia calbum genome and annotation #

Release 23 February 2021

Associated Publication
in review

Woronik, A., Tunström, K., Perry, M.W., Neethiraj, R., Stefanescu, C., Celorio-Mancera, M. de la P., Brattström, O., Hill, J., Lehmann, P., Käkelä, R., et al. (2019). A transposable element insertion is associated with an alternative life history strategy. Nature Communications 10, 1–11.

- [link to article](https://www.nature.com/articles/s41467-019-13596-2)

***************************************

### Contents ###

+ A. How we generated the annotation
+ B. Assessments
+ C. File Listing

***************************************

### A. Annotation ###
Here we are using MESPA, which is a effectively a wrapper for spaln2, which uses the results to scaffold assemblies by proteins and then generates a GFF file based upon the input protein sequences, as well as summary stats. We use it cause it works and is very fast, but there are perhaps other methods that are better, both for scaffolding and annotation (e.g. BRAKER)

Neethiraj, R., Hornett, E.A., Hill, J.A., and Wheat, C.W. (2017). Investigating the genomic basis of discrete phenotypes using a Pool-Seq-only approach: New insights into the genetics underlying colour variation in diverse taxa. Molecular Ecology 26, 4990–5002.

- [link to article](https://onlinelibrary.wiley.com/doi/full/10.1111/mec.14205)

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
