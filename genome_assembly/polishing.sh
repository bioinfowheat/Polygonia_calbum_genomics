
#####
# polishing
cd /mnt/griffin/chrwhe/Polygonia_calbum/polishing
mkdir polka_polish
cd polka_polish

# genome
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

# make soft link
ln -s /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.fa .

# reads
ln -s ../Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq .
ln -s ../Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq .

# set up paths
export PATH=/data/programs/bwa_0.7.17-r1198-dirty/:$PATH
# run
/data/programs/MaSuRCA-3.4.2/bin/polca.sh -a Pc_album.mpss.cln.msk.haploidA.fa -r 'Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq' -t 16 -m 100G
# output
/data/programs/bwa_0.7.17-r1198-dirty//bwa
/data/programs/MaSuRCA-3.4.2/bin/freebayes
/data/programs/MaSuRCA-3.4.2/bin/samtools
Substitution Errors: 106811
Insertion/Deletion Errors: 114179
Assembly Size: 379412830
Consensus Quality: 99.9418
[Thu 10 Dec 2020 11:29:06 PM CET] Success! Final report is in Pc_album.mpss.cln.msk.haploidA.fa.report; polished assembly is in Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa

/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       14,904
Maximum Contig Length : 3,782,220
Minimum Contig Length :      502
Average Contig Length : 25,451.5 ± 135,404.7
Median Contig Length :  567,834.5
Total Contigs Length :  379,328,589
Total Number of Non-ATGC Characters :   46,039,472
Percentage of Non-ATGC Characters :       12.137
Contigs >= 100 bp :       14,904
Contigs >= 200 bp :       14,904
Contigs >= 500 bp :       14,904
Contigs >= 1 Kbp :        14,764
Contigs >= 10 Kbp :        1,217
Contigs >= 1 Mbp :            71
N50 value :      572,479
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/polishing/polka_polish/Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa

ln -s /mnt/griffin/chrwhe/Polygonia_calbum/polishing/polka_polish/Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa .

export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
#
genome=Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa
library=lepidoptera_odb10
outfile=Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected_v_lepidoptera_odb10

# Run BUSCO
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30
--------------------------------------------------
|Results from dataset lepidoptera_odb10           |
--------------------------------------------------
|C:90.6%[S:90.3%,D:0.3%],F:4.6%,M:4.8%,n:5286     |
|4788   Complete BUSCOs (C)                       |
|4771   Complete and single-copy BUSCOs (S)       |
|17     Complete and duplicated BUSCOs (D)        |
|244    Fragmented BUSCOs (F)                     |
|254    Missing BUSCOs (M)                        |
|5286   Total BUSCO groups searched               |
--------------------------------------------------

# Nextpolish
mkdir nextpolish
cd nextpolish
# reads
ln -s ../Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq .
ln -s ../Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq .
ln -s ../Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa .
# https://nextpolish.readthedocs.io/en/latest/QSTART.html#quick-start
/mnt/griffin/chrwhe/software/NextPolish/nextPolish

# setup
ls Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq > sgs.fofn
genome=Pc_album.mpss.cln.msk.haploidA.fa.PolcaCorrected.fa
echo -e "task = best\ngenome = $genome\nsgs_fofn = sgs.fofn" > run.cfg
# run
/mnt/griffin/chrwhe/software/NextPolish/nextPolish run.cfg
