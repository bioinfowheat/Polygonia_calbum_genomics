# genomes to evaluate
cd /mnt/griffin/Polygonia_genome


# placing genomes in this folder
cd genomes
ln -s /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.tndrm.fa .
ln -s /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.fa .
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/polishing/bwa_polish/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/polishing/ngm_full_polish/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/polishing/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.snap_q20_70_sub_polish.fa



# assembly stats
/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.haploidA.fa
Contigs Generated :       14,904
Maximum Contig Length : 3,782,336
Minimum Contig Length :      502
Average Contig Length : 25,457.1 ± 135,438.3
Median Contig Length :   2,715.5
Total Contigs Length :  379,412,830
Total Number of Non-ATGC Characters :   46,071,815
Percentage of Non-ATGC Characters :       12.143
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,774
Contigs >= 10 Kbp :        1,217
Contigs >= 1 Mbp :            71
N50 value :      572,497
Generated using /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.fa

/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.haploidA.tndrm.fa
Contigs Generated :       14,904
Maximum Contig Length : 3,782,336
Minimum Contig Length :      502
Average Contig Length : 25,271.1 ± 134,689.9
Median Contig Length :   2,715.5
Total Contigs Length :  376,640,412
Total Number of Non-ATGC Characters :   46,053,749
Percentage of Non-ATGC Characters :       12.228
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,774
Contigs >= 10 Kbp :        1,217
Contigs >= 1 Mbp :            71
N50 value :      571,236
Generated using /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.tndrm.fa

/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       14,904
Maximum Contig Length : 3,693,197
Minimum Contig Length :      502
Average Contig Length : 24,835.9 ± 131,944.5
Median Contig Length :   2,715.5
Total Contigs Length :  370,154,884
Total Number of Non-ATGC Characters :   38,454,735
Percentage of Non-ATGC Characters :       10.389
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,753
Contigs >= 10 Kbp :        1,213
Contigs >= 1 Mbp :            68
N50 value :      559,704
Generated using /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa

/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       14,904
Maximum Contig Length : 3,724,345
Minimum Contig Length :      502
Average Contig Length : 24,969.5 ± 132,784.3
Median Contig Length :   2,715.5
Total Contigs Length :  372,145,961
Total Number of Non-ATGC Characters :   40,282,370
Percentage of Non-ATGC Characters :       10.824
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,774
Contigs >= 10 Kbp :        1,215
Contigs >= 1 Mbp :            70
N50 value :      562,921
Generated using /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       14,904
Maximum Contig Length : 3,716,248
Minimum Contig Length :      502
Average Contig Length : 24,949.5 ± 132,654.2
Median Contig Length :   2,715.5
Total Contigs Length :  371,847,733
Total Number of Non-ATGC Characters :   41,383,555
Percentage of Non-ATGC Characters :       11.129
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,772
Contigs >= 10 Kbp :        1,213
Contigs >= 1 Mbp :            69
N50 value :      562,893
Generated using /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.snap_q20_70_sub_polish.fa

######
# BUSCO
cd /mnt/griffin/Polygonia_genome/busco
# run the first geome
genome=/mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.fa
library=lepidoptera_odb10
outfile=Pc_album.mpss.cln.msk.haploidA_v_lep_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

more Pc_album.mpss.cln.msk.haploidA_v_lep_odb10/short_summary.*
