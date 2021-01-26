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
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/Pcalbum_chromosome.fa

# but what about all the unplaced scaffolds?
cd /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/
head all.agp
LG10    1       129949  1       W       Sc0000482_pilon 1       129949  +
LG10    129950  130049  2       U       100     contig  no      na
LG10    130050  137335  3       W       Sc0001006_pilon 1       7286    +
LG10    137336  137435  4       U       100     contig  no      na
LG10    137436  138798  5       W       xfSc0010224_pilon       1       1363    +
LG10    138799  138898  6       U       100     contig  no      na
LG10    138899  489609  7       W       Sc0000194_pilon 1       350711  +
LG10    489610  489709  8       U       100     contig  no      na
LG10    489710  491009  9       W       xfSc0010728_pilon       1       1300    +
LG10    491010  491109  10      U       100     contig  no      na

# need to get all IDs from the AGP
wc -l all.agp # 2701 all.agp
cut -f6 all.agp | grep 'pilon' | wc -l # 1366
cut -f6 all.agp | grep 'Sc' | wc -l # 1366
cut -f5 all.agp | grep 'W' | wc -l # 1366
cut -f7 all.agp | grep 'contig' | wc -l # 1335

cut -f6 all.agp | grep 'pilon' | sort > chromosome_agp_headers
wc -l chromosome_agp_headers  # 1366 chromosome_agp_headers
uniq chromosome_agp_headers | wc -l # 1279
# huh
uniq -c chromosome_agp_headers | sort | tail
3 Sc0000068_pilon
3 Sc0000112_pilon
3 Sc0000197_pilon
4 Sc0000045_pilon
grep 'Sc0000045_pilon' all.agp
LG12    4969518 5206254 45      W       Sc0000045_pilon 392237  628973  -
LG15    6467740 6859975 41      W       Sc0000045_pilon 1       392236  -
LG16    4501592 4884015 101     W       xfSc0000045_pilon       1       382424  -
LG4     6193808 6573103 47      W       Sc0000045_pilon 628974  1008269 -
LG7     6335610 6501102 61      W       Sc0000045_pilon 1008270 1173762 +
# so the linkage map corrected the assembly or did something incorrect.
# but it is not repeating regions ... these could just be "scaffolding" errors

# full header list
grep '>' Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa | sed 's/>//g' | sort > full_asm_headers
wc -l full_asm_headers # 14904 full_asm_headers

14904 full_asm_headers
 1279 chromosome_agp_headers
13625

# remove those from the complete pre chromosomal contig list
# output lines unique to file2
comm -13 <(sort chromosome_agp_headers) <(sort full_asm_headers) > unplaced_headers
wc -l unplaced_headers # 13625 unplaced_headers

# then get all the nonAGP scaffolds from pre chromosomal assembly, to make
# unplaced scaffold set
# then join all together
fasta_file=Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa
ids=unplaced_headers
samtools faidx $fasta_file
# search and extract
while read p; do samtools faidx $fasta_file $p ; done < $ids >> unplaced_scaffolds.fa

/data/programs/scripts/AsmQC unplaced_scaffolds.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       13,625
Maximum Contig Length :  390,522
Minimum Contig Length :      502
Average Contig Length :  3,796.7 ± 12,017.1
Median Contig Length :   2,529.0
Total Contigs Length :  51,729,392
Total Number of Non-ATGC Characters :   1,851,631
Percentage of Non-ATGC Characters :        3.579
Contigs >= 100 bp :       13,625
Contigs >= 200 bp :       13,625
Contigs >= 500 bp :       13,625
Contigs >= 1 Kbp :        13,494
Contigs >= 10 Kbp :          450
Contigs >= 1 Mbp :             0
N50 value :        4,741
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/unplaced_scaffolds.fa


# BUSCO
# join and run
cat /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/Pcalbum_chromosome.fa unplaced_scaffolds.fa > Pcalbum_chromosome_and_unplaced.fa

/data/programs/scripts/AsmQC Pcalbum_chromosome_and_unplaced.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       13,656
Maximum Contig Length : 17,467,340
Minimum Contig Length :      502
Average Contig Length : 27,322.6 ± 514,355.4
Median Contig Length :   2,541.5
Total Contigs Length :  373,116,874
Total Number of Non-ATGC Characters :   43,125,796
Percentage of Non-ATGC Characters :       11.558
Contigs >= 100 bp :       13,656
Contigs >= 200 bp :       13,656
Contigs >= 500 bp :       13,656
Contigs >= 1 Kbp :        13,525
Contigs >= 10 Kbp :          481
Contigs >= 1 Mbp :            31
N50 value :     11,186,225
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/Pcalbum_chromosome_and_unplaced.fa

#
total genome 	373,116,874 bp
31 chromosomes 321,387,482 bp
% chromo of full genome 86.1%


mkdir BUSCO
cd BUSCO
# configure environment
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini


# define datasets
genome=../Pcalbum_chromosome_and_unplaced.fa
library=lepidoptera_odb10
outfile=Pcalbum_chromosome_and_unplaced_v_lepidoptera_odb10

# Run BUSCO
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

more  Pcalbum_chromosome_and_unplaced_v_lepidoptera_odb10/short_summary.specific.lepidoptera_odb10.Pcalbum_chromosome_and_unplaced_v_lepidoptera_odb10.txt
# BUSCO version is: 5.beta
# The lineage dataset is: lepidoptera_odb10 (Creation date: 2020-08-05, number of species: 16, number of BUSCOs: 5286)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/Pcalbum_chromosome_and_unplaced.fa
# BUSCO was run in mode: genome

	  ***** Results: *****

	  C:90.4%[S:90.1%,D:0.3%],F:4.7%,M:4.9%,n:5286
	  4780    Complete BUSCOs (C)
	  4763    Complete and single-copy BUSCOs (S)
	  17      Complete and duplicated BUSCOs (D)
	  247     Fragmented BUSCOs (F)
	  259     Missing BUSCOs (M)
	  5286    Total BUSCO groups searched
