# genomes to evaluate
cd /mnt/griffin/Polygonia_genome


# placing genomes in this folder
cd genomes
cp /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.tndrm.fa .
cp /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.fa .
cp /mnt/griffin/chrwhe/Polygonia_calbum/polishing/bwa_polish/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa
cp /mnt/griffin/chrwhe/Polygonia_calbum/polishing/ngm_full_polish/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa
cp /mnt/griffin/chrwhe/Polygonia_calbum/polishing/pilon.fasta Pc_album.mpss.cln.msk.haploidA.tndrm.snap_q20_70_sub_polish.fa

# making softlinks of these in your local folder
ln -s /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.fa .
ln -s /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.fa .
ln -s /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa .
ln -s /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa .
ln -s /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.tndrm.snap_q20_70_sub_polish.fa .


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
# then assess
head -30 Pc_album.mpss.cln.msk.haploidA_v_lep_odb10/short_summary.specific.lepidoptera_odb10.Pc_album.mpss.cln.msk.haploidA_v_lep_odb10.txt
# BUSCO version is: 5.beta
# The lineage dataset is: lepidoptera_odb10 (Creation date: 2020-08-05, number of species: 16, number of BUSCOs: 5286)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.fa
# BUSCO was run in mode: genome

        ***** Results: *****

        C:90.4%[S:90.1%,D:0.3%],F:4.7%,M:4.9%,n:5286
        4782    Complete BUSCOs (C)
        4765    Complete and single-copy BUSCOs (S)
        17      Complete and duplicated BUSCOs (D)
        248     Fragmented BUSCOs (F)
        256     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

#Maria's BUSCO work
# Pc_album.mpss.cln.msk.haploidA.tndrm.bwa_70_sub_polish.fa


        ***** Results: *****

        C:90.9%[S:90.5%,D:0.4%],F:4.5%,M:4.6%,n:5286
        4804    Complete BUSCOs (C)
        4784    Complete and single-copy BUSCOs (S)
        20      Complete and duplicated BUSCOs (D)
        240     Fragmented BUSCOs (F)
        242     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

# Pc_album.mpss.cln.msk.haploidA.tndrm.fa



        ***** Results: *****

        C:90.4%[S:90.1%,D:0.3%],F:4.7%,M:4.9%,n:5286
        4782    Complete BUSCOs (C)
        4765    Complete and single-copy BUSCOs (S)
        17      Complete and duplicated BUSCOs (D)
        248     Fragmented BUSCOs (F)
        256     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

# Pc_album.mpss.cln.msk.haploidA.tndrm.ngm_70_sub_polish.fa


        ***** Results: *****

        C:90.8%[S:90.5%,D:0.3%],F:4.5%,M:4.7%,n:5286
        4799    Complete BUSCOs (C)
        4783    Complete and single-copy BUSCOs (S)
        16      Complete and duplicated BUSCOs (D)
        238     Fragmented BUSCOs (F)
        249     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

# Pc_album.mpss.cln.msk.haploidA.tndrm.snap_q20_70_sub_polish.fa


        ***** Results: *****

        C:90.6%[S:90.3%,D:0.3%],F:4.6%,M:4.8%,n:5286
        4789    Complete BUSCOs (C)
        4771    Complete and single-copy BUSCOs (S)
        18      Complete and duplicated BUSCOs (D)
        243     Fragmented BUSCOs (F)
        254     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

#summary table



BUSCO						Assembly stats
assembly			C:	S: 	D: 	F: 	M: 	n:	N50	   max contig length	  total contigs length	  total non-ATGC content
haploidA			90.4%	90.1	0.3	4.7	4.9	5286	572,497 	   3,782,336	        379,412,830	              46,071,815
haploidA tndrm		90.4%	90.1	0.3	4.7	4.9		571,236 	   3,782,336    	376,640,412                   46,053,749
bwa	        		90.9% 	90.5	0.4	4.5     4.6		559,704	           3,693,197	        370,154,884	              38,454,735
ngm     			90.8%	90.5	0.3	4.5	4.7		562,921	           3,724,345	        372,145,961	              40,282,370
snap    			90.6%	90.3	0.3	4.6	4.8		562,893	           3,716,248	        371,847,733	              41,383,555
