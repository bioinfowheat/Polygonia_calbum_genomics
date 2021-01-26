# generate the chromosome from Passi's AGP file
scp CW12_11_2018.zip chrwhe@miles.zoologi.su.se:/mnt/griffin/chrwhe/Pc_album/linkagemap
# script from https://github.com/WormBase/wormbase-pipeline/blob/master/for_cvs/agp2fasta.pl
cd /mnt/griffin/chrwhe/Pc_album/chomosome_level
find . /mnt/griffin/chrwhe/Pc_album/linkagemap -name "*.agp" > agp_files
while read p; do ln $p . ; done < agp_files
ln -s /mnt/griffin/chrwhe/Pc_album/final/Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa .

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       14,904
Maximum Contig Length : 3,740,340
Minimum Contig Length :      502
Average Contig Length : 25,059.5 ± 133,414.4
Median Contig Length :   2,715.5
Total Contigs Length :  373,486,500
Total Number of Non-ATGC Characters :   43,176,850
Percentage of Non-ATGC Characters :       11.560
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,773
Contigs >= 10 Kbp :        1,215
Contigs >= 1 Mbp :            69
N50 value :      563,079
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/final/Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa

#
perl /mnt/griffin/chrwhe/software/agp2genome.pl chr1.agp Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa

ls *agp > agp_files_local
# the sorted in editor for this
more agp_files_local_sorted
chr1.agp
chr2.agp
chr3.agp
chr4.agp
chr5.agp
chr6.agp
chr7.agp
chr8.agp
chr9.agp
chr10.agp
chr11.agp
chr12.agp
chr13.agp
chr14.agp
chr15.agp
chr16.agp
chr17.agp
chr18.agp
chr19.agp
chr20.agp
chr21.agp
chr22.agp
chr23.agp
chr24.agp
chr25.agp
chr26.agp
chr27.agp
chr28.agp
chr29.agp
chr30.agp
chr31.agp

agp_files_local_sorted

while read p; do perl /mnt/griffin/chrwhe/software/agp2genome.pl $p Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa ; cat supercontigs.fa >> Pcalbum_chromosome.fa ; rm supercontigs.fa ; done < agp_files_local_sorted
