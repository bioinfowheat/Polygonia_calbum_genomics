# align
# https://mummer4.github.io/manual/manual.html
# list reference genome first, then query genome
# Prefix=nucmer_aln_Pnap_v_Pmac000.1polish

cd /mnt/griffin/chrwhe/Polygonia_calbum/synteny
mkdir synteny
cd synteny

# genomes
ln -s /mnt/griffin/chrwhe/Melitaea_cinxia_v2/Cinxia_v2_final_050918_sorted.fasta .
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/Pcalbum_chromosome.fa .

Reference=Cinxia_v2_final_050918_sorted.fasta
/data/programs/scripts/AsmQC $Reference

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :           31
Maximum Contig Length : 22,468,027
Minimum Contig Length : 7,906,052
Average Contig Length : 15,823,162.4 ± 3,804,975.0
Median Contig Length :  16,559,386.0
Total Contigs Length :  490,518,034
Total Number of Non-ATGC Characters :     15,775
Percentage of Non-ATGC Characters :        0.003
Contigs >= 100 bp :           31
Contigs >= 200 bp :           31
Contigs >= 500 bp :           31
Contigs >= 1 Kbp :            31
Contigs >= 10 Kbp :           31
Contigs >= 1 Mbp :            31
N50 value :     17,548,400
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/synteny/Cinxia_v2_final_050918_sorted.fasta

Query=Pcalbum_chromosome.fa
/data/programs/scripts/AsmQC $Query

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :           31
Maximum Contig Length : 17,467,340
Minimum Contig Length : 3,621,594
Average Contig Length : 10,367,338.1 ± 3,102,067.3
Median Contig Length :  4,883,024.0
Total Contigs Length :  321,387,482
Total Number of Non-ATGC Characters :   41,274,165
Percentage of Non-ATGC Characters :       12.842
Contigs >= 100 bp :           31
Contigs >= 200 bp :           31
Contigs >= 500 bp :           31
Contigs >= 1 Kbp :            31
Contigs >= 10 Kbp :           31
Contigs >= 1 Mbp :            31
N50 value :     11,721,770
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/synteny/Pcalbum_chromosome.fa

# generating contig list


grep '>' $Query | sed 's/>//' > Pcalbum_contigs.txt
grep '>' $Reference | sed 's/>//' > Cinxia_contigs.txt

head *txt
==> Cinxia_contigs.txt <==
M01_B01_H21
M02_B04_H01a
M03_B15_H11
M04_B12_H19a
M05_B06_H03
M06_B05_H10a
M07_B18_H16
M08_B17_H15
M09_B10_H20a
M10_B09_H06a

==> Pcalbum_contigs.txt <==
LG1
LG2
LG3
LG4
LG5
LG6
LG7
LG8
LG9
LG10


Prefix=nucmer_aln_Mcin_v_Pca
/data/programs/mummer-4.0.0beta2/nucmer --mum -c 100 -t 5 -p $Prefix $Reference $Query

# Options (default value in (), *required):
#      --mum                                Use anchor matches that are unique in both the reference and query (false)
#      --maxmatch                           Use all anchor matches regardless of their uniqueness (false)
#  -b, --breaklen=uint32                    Set the distance an alignment extension will attempt to extend poor scoring regions before giving up (200)
#  -c, --mincluster=uint32                  Sets the minimum length of a cluster of matches (65)
#  -D, --diagdiff=uint32                    Set the maximum diagonal difference between two adjacent anchors in a cluster (5)
#  -d, --diagfactor=double                  Set the maximum diagonal difference between two adjacent anchors in a cluster as a differential fraction of the gap length (0.12)
#      --noextend                           Do not perform cluster extension step (false)
#  -f, --forward                            Use only the forward strand of the Query sequences (false)
#  -g, --maxgap=uint32                      Set the maximum gap between two adjacent matches in a cluster (90)
#  -l, --minmatch=uint32                    Set the minimum length of a single exact match (20)
#  -L, --minalign=uint32                    Minimum length of an alignment, after clustering and extension (0)
#      --nooptimize                         No alignment score optimization, i.e. if an alignment extension reaches the end of a sequence, it will not backtrack to optimize the alignment score and instead terminate the alignment at the end of the sequence (false)
#  -r, --reverse                            Use only the reverse complement of the Query sequences (false)
#      --nosimplify                         Don't simplify alignments by removing shadowed clusters. Use this option when aligning a sequence to itself to look for repeats (false)
#  -p, --prefix=PREFIX                      Write output to PREFIX.delta (out)
#      --delta=PATH                         Output delta file to PATH (instead of PREFIX.delta)
#      --sam-short=PATH                     Output SAM file to PATH, short format
#      --sam-long=PATH                      Output SAM file to PATH, long format
#      --save=PREFIX                        Save suffix array to files starting with PREFIX
#      --load=PREFIX                        Load suffix array from file starting with PREFIX
#      --batch=BASES                        Proceed by batch of chunks of BASES from the reference
#  -t, --threads=NUM                        Use NUM threads (# of cores)
#  -U, --usage                              Usage
#  -h, --help                               This message
#      --full-help                          Detailed help
#  -V, --version                            Version

/data/programs/mummer-4.0.0beta2/show-coords -r -c -l $Prefix.delta > $Prefix.coords
# clean up output
head $Prefix.coords
# NUCMER
#
#     [S1]     [E1]  |     [S2]     [E2]  |  [LEN 1]  [LEN 2]  |  [% IDY]  |  [LEN R]  [LEN Q]  |  [COV R]  [COV Q]  | [TAGS]
# ===============================================================================================================================
#        1      525  | 12350468 12349944  |      525      525  |    98.67  | 11357067 12381485  |     0.00     0.00  | Chromosome_1       Sc0000001_pilon
#        1      525  |    70293    70816  |      525      524  |    98.48  | 11357067  6176668  |     0.00     0.01  | Chromosome_1       Sc0000010_pilon
#        1      525  |    81545    82070  |      525      526  |    98.10  | 11357067  4131511  |     0.00     0.01  | Chromosome_1       Sc0000025_pilon
#        1      525  |  2650798  2650275  |      525      524  |    98.29  | 11357067  2683253  |     0.00     0.02  | Chromosome_1       Sc0000034_pilon
#        1      525  |  2449780  2449257  |      525      524  |    98.29  | 11357067  2488271  |     0.00     0.02  | Chromosome_1       Sc0000037_pilon


cat $Prefix.coords | sed 1,5d | tr -s ' ' | awk 'BEGIN {FS=" "; OFS="\t"} {;print $1,$2,$4,$5,$7,$8,$10,$12,$13,$18,$19}' | head | column -t
# 1  525  12350468  12349944  525  525  98.67  11357067  12381485  Chromosome_1  Sc0000001_pilon
# 1  525  70293     70816     525  524  98.48  11357067  6176668   Chromosome_1  Sc0000010_pilon
# 1  525  81545     82070     525  526  98.10  11357067  4131511   Chromosome_1  Sc0000025_pilon
# 1  525  2650798   2650275   525  524  98.29  11357067  2683253   Chromosome_1  Sc0000034_pilon
# 1  525  2449780   2449257   525  524  98.29  11357067  2488271   Chromosome_1  Sc0000037_pilon
# 1  525  4011      4535      525  525  98.48  11357067  6410227   Chromosome_1  xfSc0000001_pilon
# 1  482  664194    663713    482  482  98.13  11357067  5174956   Chromosome_1  xfSc0000002_pilon
# 1  525  1777215   1776691   525  525  98.48  11357067  1954889   Chromosome_1  xfSc0000011_pilon
# 1  525  32388     32912     525  525  98.48  11357067  1762511   Chromosome_1  xfSc0000015_pilon
# 1  525  1294769   1294245   525  525  98.48  11357067  1379005   Chromosome_1  xfSc0000016_pilon

cat $Prefix.coords | sed 1,5d | tr -s ' ' | awk 'BEGIN {FS=" "; OFS=","} {;print $1,$2,$4,$5,$7,$8,$10,$12,$13,$18,$19}' > $Prefix.filt.coords


#### alternative alignment method allows for filtering before plotting, produces tsv-style output
# /data/programs/mummer-4.0.0beta2/delta-filter -h
#
# USAGE: /data/programs/mummer-4.0.0beta2/.libs/delta-filter  [options]  <deltafile>
#
# -1            1-to-1 alignment allowing for rearrangements
#               (intersection of -r and -q alignments)
# -g            1-to-1 global alignment not allowing rearrangements
# -h            Display help information
# -i float      Set the minimum alignment identity [0, 100], default 0
# -l int        Set the minimum alignment length, default 0
# -m            Many-to-many alignment allowing for rearrangements
#               (union of -r and -q alignments)
# -q            Maps each position of each query to its best hit in
#               the reference, allowing for reference overlaps
# -r            Maps each position of each reference to its best hit
#               in the query, allowing for query overlaps
# -u float      Set the minimum alignment uniqueness, i.e. percent of
#               the alignment matching to unique reference AND query
#               sequence [0, 100], default 0
# -o float      Set the maximum alignment overlap for -r and -q options
#               as a percent of the alignment length [0, 100], default 100
#
#   Reads a delta alignment file from either nucmer or promer and
# filters the alignments based on the command-line switches, leaving
# only the desired alignments which are output to stdout in the same
# delta format as the input. For multiple switches, order of operations
# is as follows: -i -l -u -q -r -g -m -1. If an alignment is excluded
# by a preceding operation, it will be ignored by the succeeding

/data/programs/mummer-4.0.0beta2/delta-filter -q -r -1 $Prefix.delta > $Prefix.qr1_filter.delta
/data/programs/mummer-4.0.0beta2/show-coords -r -c -l $Prefix.qr1_filter.delta > $Prefix.qr1_filter.coords
more $Prefix.qr1_filter.coords

# get output for circle plot
cat $Prefix.qr1_filter.coords | sed 1,5d | tr -s ' ' | awk 'BEGIN {FS=" "; OFS=","} {;print $1,$2,$4,$5,$7,$8,$10,$12,$13,$18,$19}' > $Prefix.qr1_filter.reformat.coords
