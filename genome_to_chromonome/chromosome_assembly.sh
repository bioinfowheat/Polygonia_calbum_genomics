# generate the chromosome from Passi's AGP file
scp CW12_11_2018.zip chrwhe@miles.zoologi.su.se:/mnt/griffin/chrwhe/Pc_album/linkagemap
# script from https://github.com/WormBase/wormbase-pipeline/blob/master/for_cvs/agp2fasta.pl
cd /mnt/griffin/chrwhe/Pc_album/chomosome_level
find . /mnt/griffin/chrwhe/Pc_album/linkagemap -name "*.agp" > agp_files
while read p; do ln $p . ; done < agp_files
ln -s /mnt/griffin/chrwhe/Pc_album/final/Pc_album.mpss.cln.msk.haploidA.tndrm.polished.fa .

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
