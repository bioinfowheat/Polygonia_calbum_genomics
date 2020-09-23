# make reference index

REF=Canis_familiaris.CanFam3.1.dna_sm.chromosome.38.fa
bwa_path=/data/programs/bwa_0.7.17-r1198-dirty/
$bwa_path/bwa index $REF

# map fastq data
# default samtools is Version: 1.10 (using htslib 1.10)
/data/programs/bwa_0.7.17-r1198-dirty/bwa mem -M -t 20 Canis_familiaris.CanFam3.1.dna_sm.chromosome.38.fa {}.1.fq.gz {}.2.fq.gz | samtools view -bS -F4 -q 20 | samtools sort -m 1G -@ 5 -o {}.bam

# index
samtools index *bam
