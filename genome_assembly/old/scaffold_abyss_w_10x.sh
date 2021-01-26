cd /share/chrisbak
find . -name "*170704_isolation_10Xseq.pupa*"
# raw
./reads2/compressed/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_2.fastq.gz
./reads2/compressed/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.fastq.gz
# cleaned
/reads2/clean/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_2.ctq.fq.gz
/reads2/clean/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.ctq.fq.gz

# note on data
# Clustering was done by 'cBot' and samples were sequenced on HiSeqX
# (HiSeq Control Software HD 3.4.0.38/RTA 2.7.7) with a 2x151 setup
# using 'HiSeq X SBS' chemistry. The Bcl to FastQ conversion was
# performed using bcl2fastq_2.19 from the CASAVA software suite.
# The quality scale used is Sanger / phred33 / Illumina 1.8+.

cd /mnt/griffin/chrwhe/Polygonia_calbum/10x
# raw
scp chrisbak@ren.lan.zoologi.su.se:/share/chrisbak//reads2/compressed/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_*.fastq.gz

# cleaned
scp chrisbak@ren.lan.zoologi.su.se:/share/chrisbak/reads2/clean/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_*.ctq.fq.gz .

# ARCS
# https://github.com/bcgsc/arcs
# The ARCS+LINKS pipeline requires two input files:
# Draft assembly fasta file
# Interleaved linked reads file (Barcode sequence expected in the BX tag of the read header;
# Run Long Ranger basic on raw chromium reads to produce this interleaved file)

# UPPMAX

ssh chriw@rackham.uppmax.uu.se
cd /proj/snic2020-5-284

# get data
scp chrwhe@miles.zoologi.su.se:/mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa Polygonia-scaffolds.96k.fa
scp chrwhe@miles.zoologi.su.se:/mnt/griffin/chrwhe/Polygonia_calbum/10x/*170704_isolation_10Xseq* .

zcat Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.ctq.fq.gz | head
@ST-E00201:240:HCHJCCCXY:5:2224:21460:72280 1:N:0:CCACTACA
TCATGAGAGGTTCATCGTTATCTTTACTTGGTGGTAGAGCTTTGTGCAAGTTCGTCTGGGTAGGTGACCACTTGAACCACTCTTCAGATATTCTAGCGCTAAGCAGCGGTATATGTATTGTTGTGTTCCGGTACGAGTGAGCCAGTGTAAT
+
AAFFFJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@ST-E00201:240:HCHJCCCXY:5:2224:21420:72280 1:N:0:TGCGGCTT
GTAAACCAGTTATCGCACATAACACCGTCCTACCTATTTGTCACTTTGACATCGAAAGTTACATAACTTTTCATCAAAGTACGTGGAGTCTTCCAGCTATAGTGCATCCCTCCTCCCCCTATTCCACGGTCGGCTGTGTTCAGCAGCCCTA
+
--AAAA<AFFJJJJJJFJJJ<AFJFFA-7F7-FFJJJJFFFF7JJ<<JFJF-<JJJJJJJJJ-FAFJAFJJF<JJJJ<JJJFAFJJFJ7FFFJJJJ-7-<FAAJ7FFJAJ-FF7A7AF-A7----<-F<-A-<7A-A-A7AFAFJFFFFF-
@ST-E00201:240:HCHJCCCXY:5:2224:21257:72280 1:N:0:ATGAAGAC
CATGCCTGTACCAACTCTGACATACTGTATAAAAAATCCGTATGCATTCGTATCCTTTGTGCTAGCTTAGTGCTAGTAGTTTGGGCTGTGCGTTGATATCAGTCACTCGATCAATTATTTAATATATAGAGATAGAAATATTGATAGATAG


module load bioinfo-tools
module load longranger
module load ARCS

If you demultiplexed with 'longranger mkfastq' or directly with
   Illumina bcl2fastq, then set --fastqs to the project folder containing
   FASTQ files. In addition, set --sample to the name prefixed to the FASTQ
   files comprising your sample. For example, if your FASTQs are named:
       subject1_S1_L001_R1_001.fastq.gz
   then set --sample=subject1


mkdir files
mv *gz files


######
# making an interleaved file.

longranger basic --id=ID --fastqs=files/

# If your files came from bcl2fastq or mkfastq:
#  - Make sure you are specifying the correct --sample(s), i.e. matching the sample sheet
#  - Make sure your files follow the correct naming convention, e.g. SampleName_S1_L001_R1_001.fastq.gz (and the R2 version)
#  - Make sure your --fastqs points to the correct location.

mv Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.ctq.fq.gz Polygonia_S1_L001_R1_001.fastq.gz
mv Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_2.ctq.fq.gz Polygonia_S1_L001_R2_001.fastq.gz

longranger basic --id=ID --fastqs=files/ --sample=Polygonia
#
cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger
mkdir files
cd files
ln -s ../../Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.ctq.fq.gz Polygonia_S1_L001_R1_001.fastq.gz
ln -s ../../Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_2.ctq.fq.gz Polygonia_S1_L001_R2_001.fastq.gz

cd ..

# running, appears to work.
/mnt/griffin/chrwhe/software/longranger-2.2.2/longranger basic --id=ID --fastqs=files/ --sample=Polygonia --localcores=20 --localmem=100
Outputs:
- Run summary:             /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID/outs/summary.csv
- FASTQ barcoded:          /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID/outs/barcoded.fastq.gz
- BAM barcoded, unaligned: null

Waiting 6 seconds for UI to do final refresh.
Pipestance completed successfully!

Saving pipestance info to ID/ID.mri.tgz

zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID/outs/barcoded.fastq.gz | head
@ST-E00201:240:HCHJCCCXY:5:1201:21937:40407
GAACATAATGTGCGTGAATCGAACAATAAAATGCTGGACGTGTTCACCGGTTCTAGTTTTTATATAGAATAACACTTTGTATCACTGCTTTTAAAAGTTTGAATGATCGTGGAATACATATTATGCTA
+
AFAF<JFFJ<F-<-7F<-<<7FJA<<JJJFJ7-77<7F7F77-<7A<7<7-77FJJJF<FJ-A--A7AJ-7F<FF-7J<<J<-FA--AJJ<7-AAAFAJ-77FJF<-7FFFAAA-77AF---77-7AA
@ST-E00201:240:HCHJCCCXY:5:1201:21937:40407
CTCTCCTCTACCAAAGGTTGCCTGGAAGAGATCGCTGTTTTAGCGATAAGGCCGCCTATTGTACATTTTTCTTTTCTTTGTTTTTGTTTTACTCCTATTATTTTTGTCTATATTGGTGTGCAATAAAGAGTATATAAATAAATAAATAAAA
+
AAAFFJJJJJJFJFFJFFJFFJJJA7A-FFFJJFJFFJAFJJJJAJJJJJJJJJJJJAJJJJJJJJJJJJJAJFJAAJJJFFJJFJJJJJJJAJFJJJFJJJJJJJFJFJJJJJJFJFJJJJAAFJFJJ-<<FFJF-7FJFFJFJFJJFAJ
@ST-E00201:240:HCHJCCCXY:5:2122:12966:12173
GCGAATTTATAATTTGTTTGACATATTAGTTTGCAACATCTATGAACGCGCTTAATAAAATTTATGCTTTCAAATCGTAATATATAATATATTATTAATATATATTGCATTTAGTTTTAACTATGTTG
+
JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJFJJJJJJJJJJJJJFJJJJJJJJJJJJJJJJJJJJFJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJA-AFJJJJJJJJJFF<
@ST-E00201:240:HCHJCCCXY:5:2122:12966:12173
GGCTGTTTAAAAAAAAGGTTACTTATTTGGACATTAAATATAATGATTGGTGATTAGTCCGGCTTGGAATCCGGGACTTTGGGACAGCACTATTAGCACTAATTTAATATAACCACTAAGCCAACAACATAGTTAAAACTAAATGCAATAT
+
AAFFFJFJJJJJJJJJJJJJFJJJJJJJFJJJJJJJJJJJJJJJJJFJJJFFJJJJFJJJJFJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@ST-E00201:240:HCHJCCCXY:5:1109:17807:72420
GTAATGAAACAAATAAATCTAATATATAAAGCTGAAGAGTTTGTTTGTTTGATACGGCTAATCTCAGGAATCCTTTTGAGTTCTCGAGGAAAGCTAGGCTTATTCTTTACATTTT
+
FJJJFJJ<FJJJFFJJJ7FFFFFF-FJJA<FJ<J<FFFF---<-F-<7-AJFJFFFJJJFFFJ--A<JJ<<FJ<-<7-FFFAF<-F-F-<7-AF--777A-AA-FAJF-AA-7A<
@ST-E00201:240:HCHJCCCXY:5:1109:17807:72420
GCTTCGAGATTTTTTTTTCTATTTTTTTATTGAATTGATTTATTACAACGATATACTGGTTATCTTCACCCGCATTTATGTGAAACGATGGATTTTATTAAAACTTATGTGATACTATGTGCCCAGCGGTTTCAACTGCGTCTACTTAAAA
+
--AA---<FJJFF<F-<-FJ<--7-F7<---F<<J-<-<AJF-7--FFJF<FJJJJ-<FFF7-A---FF-777AAAF-A-<-AJ7F<<A7F-7-----7-<-AJ-A7A<A--7FFJJA-<-<J--7A<J7<FF---7<A<7-A--<FF--7
@ST-E00201:

# compare fastq headers
zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/files/Polygonia_S1_L001_R1_001.fastq.gz | \
sed -n '1~4p' | head
@ST-E00201:240:HCHJCCCXY:5:2224:21460:72280 1:N:0:CCACTACA
@ST-E00201:240:HCHJCCCXY:5:2224:21420:72280 1:N:0:TGCGGCTT
@ST-E00201:240:HCHJCCCXY:5:2224:21257:72280 1:N:0:ATGAAGAC
@ST-E00201:240:HCHJCCCXY:5:2224:21237:72280 1:N:0:CCACTACA
@ST-E00201:240:HCHJCCCXY:5:2224:21217:72280 1:N:0:ATGAAGAC
@ST-E00201:240:HCHJCCCXY:5:2224:20791:72280 1:N:0:GATTCTGG


zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID/outs/barcoded.fastq.gz | \
sed -n '1~4p' | head
@ST-E00201:240:HCHJCCCXY:5:1201:21937:40407
@ST-E00201:240:HCHJCCCXY:5:1201:21937:40407
@ST-E00201:240:HCHJCCCXY:5:2122:12966:12173
@ST-E00201:240:HCHJCCCXY:5:2122:12966:12173
@ST-E00201:240:HCHJCCCXY:5:1109:17807:72420
@ST-E00201:240:HCHJCCCXY:5:1109:17807:72420


#####
# running again with raw 10x data.
cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/files_raw
ln -s ../../Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_1.fastq.gz Polygonia_S1_L001_R1_001.fastq.gz
ln -s ../../Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_10Xseq.pupa.1_2.fastq.gz Polygonia_S1_L001_R2_001.fastq.gz
cd ..

# running, appears to work.
/mnt/griffin/chrwhe/software/longranger-2.2.2/longranger basic --id=ID_raw --fastqs=files_raw/ --sample=Polygonia --localcores=30 --localmem=100

utputs:
- Run summary:             /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/summary.csv
- FASTQ barcoded:          /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz
- BAM barcoded, unaligned: null

Waiting 6 seconds for UI to do final refresh.
Pipestance completed successfully!

Saving pipestance info to ID_raw/ID_raw.mri.tgz
#
zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz | \
sed -n '1~4p' | grep 'BX' | head
zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz | sed -n '1~4p' | grep 'BX' | head
@ST-E00201:240:HCHJCCCXY:5:2111:1925:66355 BX:Z:AAACACCAGACAATAC-1
@ST-E00201:240:HCHJCCCXY:5:2111:1925:66355 BX:Z:AAACACCAGACAATAC-1
@ST-E00201:240:HCHJCCCXY:5:1104:15696:1959 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1104:15696:1959 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1104:5528:52309 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1104:5528:52309 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1107:24129:22511 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1107:24129:22511 BX:Z:AAACACCAGCTAACTC-1
@ST-E00201:240:HCHJCCCXY:5:1110:13890:27064 BX:Z:AAACACCAGCTAACTC-1

# huh
zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID/outs/barcoded.fastq.gz | sed -n '1~4p' | grep 'BX' | wc -l
zcat /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz | sed -n '1~4p' | grep 'BX' | wc -l
336,697,124 # ctq cleaned
367,646,698 # ID_raw

# if want stats on reads per barcode
https://github.com/ucdavis-bioinformatics/proc10xG

# from ARCS paper
# Chromium reads were then aligned to the contig and scaffold sequences using BWA mem v0.7.15 (default val- ues, -t12) (Li and Durbin, 2010), and sorted by name.

#
cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs
ln -s ../*10X* .
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa .



# from bee publication from Webster
# We ran the ARCS+LINKS Pipeline [35, 36] to utilize the barcoding information contained in 10x
#  linked reads. First, we mapped 10x reads to PacBio contigs using LongRanger 2.1.2
#  (10X Genomics, CA). ARCS v1.0.1 was then used to identify pairs of contigs with evidence
#  that they are connected based on the observation of linked reads from the same molecule.
#  Default parameters were used, except for modifying barcode read frequency range (−m 20–10,000). The results of ARCS were processed with the LINKS v1.8.5 scaffolding algorithm to constructs scaffolds based on 10x read pairing information. We adjusted the –a parameter, which controls the ratio of barcode links between two most supported graph edges, to 0.9. The ARCS+LINKS pipeline produced 299 scaffolds with N50 of 8.8Mbp and longest scaffold of 13.3Mbp.


# To run the pipeline in default mode, run Examples/arcs-make arcs.
# For example, to scaffold the assembly my_scaffolds.fa with the interleaved, l
# ongranger processed reads my_reads.fq.gz, specifying a minimum contig length of 1000bp:

# Example: To run tigmint and arcs with myDraft.fa, myReads.fq.gz, and a custom multiplicty range, run:
#         ./arcs-make arcs-tigmint draft=myDraft reads=myReads m=[User defined multiplicty range]
# To ensure that the pipeline runs correctly, make sure that the following tools
# are in your PATH:
bwa, tigmint, samtools, arcs (>= v1.1.0), LINKS (>= v1.8.6)
# git clone https://github.com/bcgsc/tigmint && cd tigmint
wget https://github.com/bcgsc/LINKS/releases/download/v1.8.7/links_v1-8-7.tar.gz
tar -zxvf links_v1-8-7.tar


######
# https://github.com/bcgsc/arcs
# trying arcs default
# To run the pipeline in default mode, run Examples/arcs-make arcs.
# For example, to scaffold the assembly my_scaffolds.fa with the interleaved,
# longranger processed reads my_reads.fq.gz, specifying a minimum contig length of 1000bp:

cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs
mkdir arcs_default
cd arcs_default
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa my_scaffolds.fa
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz my_reads.fq.gz
# get paths set based upon requirements
export PATH=/data/programs/bwa_0.7.17-r1198-dirty/:/mnt/griffin/chrwhe/software/tigmint/bin/:/mnt/griffin/chrwhe/software/links_v1.8.7/:$PATH
# run
/mnt/griffin/chrwhe/software/arcs/Examples/arcs-make arcs draft=my_scaffolds reads=my_reads z=1000 -b arcs_default
# renames fasta
# runs bwa mem

/data/programs/scripts/AsmQC my_scaffolds_c5_m50-10000_s98_r0.05_e30000_z1000_l5_a0.3.scaffolds.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :      517,302
Maximum Contig Length : 4,222,106
Minimum Contig Length :       96
Average Contig Length :    943.7 ± 19,114.6
Median Contig Length :     216.0
Total Contigs Length :  488,197,632
Total Number of Non-ATGC Characters :   34,976,289
Percentage of Non-ATGC Characters :        7.164
Contigs >= 100 bp :      460,381
Contigs >= 200 bp :      275,916
Contigs >= 500 bp :      123,356
Contigs >= 1 Kbp :        34,946
Contigs >= 10 Kbp :        3,583
Contigs >= 1 Mbp :            38
N50 value :       25,103
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs/arcs_default/my_scaffolds_c5_m50-10000_s98_r0.05_e30000_z1000_l5_a0.3.scaffolds.fa

##################
# arks
cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs
mkdir arks_default
cd arks_default
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa my_scaffolds.fa
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz my_reads.fq.gz
# get paths set based upon requirements
export PATH=/data/programs/bwa_0.7.17-r1198-dirty/:/mnt/griffin/chrwhe/software/tigmint/bin/:/mnt/griffin/chrwhe/software/links_v1.8.7/:$PATH
# arks
/mnt/griffin/chrwhe/software/arcs/Examples/arcs-make arks draft=my_scaffolds reads=my_reads k=60 -b arks_default

=>Scaffolding ended : Mon 14 Dec 2020 10:37:14 PM CET
Scaffolds layout in: my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.scaffolds
Scaffold graph in: my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.gv


=>Making FASTA file : Mon 14 Dec 2020 10:37:14 PM CET
Scaffolds FASTA in : my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.scaffolds.fa


=>Wrote correspondence file tracking LINKScontigID <=> OriginalContigNames : my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.assembly_correspondence.tsv

Scaffolding executed normally Mon 14 Dec 2020 10:37:23 PM CET
/mnt/griffin/chrwhe/software/links_v1.8.7/LINKS [v1.8.7] terminated successfully on Mon 14 Dec 2020 10:37:23 PM CET

/data/programs/scripts/AsmQC my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.scaffolds.fa
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :      517,288
Maximum Contig Length : 4,222,106
Minimum Contig Length :       96
Average Contig Length :    943.8 ± 18,994.2
Median Contig Length :     216.0
Total Contigs Length :  488,199,032
Total Number of Non-ATGC Characters :   34,977,689
Percentage of Non-ATGC Characters :        7.165
Contigs >= 100 bp :      460,367
Contigs >= 200 bp :      275,902
Contigs >= 500 bp :      123,342
Contigs >= 1 Kbp :        34,932
Contigs >= 10 Kbp :        3,567
Contigs >= 1 Mbp :            41
N50 value :       25,098
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs/arks_default/my_scaffolds_c5_m50-10000_k60_r0.05_e30000_z500_l5_a0.3.scaffolds.fa

#original
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :      517,438
Maximum Contig Length : 2,274,482
Minimum Contig Length :       96
Average Contig Length :    943.5 ± 15,825.1
Median Contig Length :     253.5
Total Contigs Length :  488,184,032
Total Number of Non-ATGC Characters :   34,962,689
Percentage of Non-ATGC Characters :        7.162
Contigs >= 100 bp :      460,517
Contigs >= 200 bp :      276,052
Contigs >= 500 bp :      123,492
Contigs >= 1 Kbp :        35,082
Contigs >= 10 Kbp :        3,716
Contigs >= 1 Mbp :            31
N50 value :       24,994
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs/arks_default/my_scaffolds.fa

# new kmer
mkdir arks_32
cd arks_32
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa my_scaffolds.fa
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/10x/longranger/ID_raw/outs/barcoded.fastq.gz my_reads.fq.gz
# get paths set based upon requirements
export PATH=/data/programs/bwa_0.7.17-r1198-dirty/:/mnt/griffin/chrwhe/software/tigmint/bin/:/mnt/griffin/chrwhe/software/links_v1.8.7/:$PATH
# arks
/mnt/griffin/chrwhe/software/arcs/Examples/arcs-make arks draft=my_scaffolds reads=my_reads k=32 -b arks_k32
Finished reading user inputs...entering runArcs()...
Running: arcs 1.1.1
ARKS method
 pid 53797
 -c 5
 -d 0
 -e 30000
 -l 0
 -m 50-10000
 -r 0.05
 -v 1
 -z 500
 --gap=100
 -k 32
 -j 0.55
 -t 8
 -b my_scaffolds_c5_m50-10000_k32_r0.05_e30000_z500
 -g my_scaffolds_c5_m50-10000_k32_r0.05_e30000_z500.dist.gv
 --barcode-counts=barcodeMultiplicityArcs.tsv
 --tsv=my_scaffolds_c5_m50-10000_k32_r0.05_e30000_z500_main.tsv
 -a NA
 -f my_scaffolds.renamed.fa
 -u NA
 my_reads.fq.gz

 /data/programs/scripts/AsmQC  my_scaffolds_c5_m50-10000_k32_r0.05_e30000_z500_l5_a0.3.scaffolds.fa
 -------------------------------
     AssemblyQC Result
 -------------------------------
 Contigs Generated :      517,223
 Maximum Contig Length : 3,740,081
 Minimum Contig Length :       96
 Average Contig Length :    943.9 ± 19,789.8
 Median Contig Length :     216.0
 Total Contigs Length :  488,205,532
 Total Number of Non-ATGC Characters :   34,984,189
 Percentage of Non-ATGC Characters :        7.166
 Contigs >= 100 bp :      460,302
 Contigs >= 200 bp :      275,837
 Contigs >= 500 bp :      123,277
 Contigs >= 1 Kbp :        34,867
 Contigs >= 10 Kbp :        3,508
 Contigs >= 1 Mbp :            48
 N50 value :       25,234
 Generated using /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs/arks_32/my_scaffolds_c5_m50-10000_k32_r0.05_e30000_z500_l5_a0.3.scaffolds.fa



arks_test-demo$ zcat test_reads.fq.gz | more
@gi|453232067|ref|NC_003281.10|_1491891_1491677_1_0_0_0_0:0:0_0:0:0_1e04b BX:Z:TATATCCTCTAGCTAG-1
GACTTGTGTGCTTCAACTCAGAGTTTTTGGCATAAAAACTGTAGTTATTCACATTTTCAGTCATAAATTGGCTAAAAATGTCAATAAATACCGTATTTCTGCCAACAATTTGACAATAGAGCACATTT
+
GEFIFEAEEFBIDFDDCCDCB?ECCCBDDC?ECDCDA?ADABCABAFABC@@@@B<BC@@@<@>@=?>??<>BC?BEA@>=??=A?<=A>>>???<>>><>>>A@=;=?><A<>==;=?<<?=A?>>=
@gi|453232067|ref|NC_003281.10|_1491891_1491677_1_0_0_0_0:0:0_0:0:0_1e04b BX:Z:TATATCCTCTAGCTAG-1
CTGAAATTTGGAAAAAATTGGGTTACTGTAGCTTCGAAAGTACGCAAACACCGAATTTTACGGAATTTCGCACAAAATGGCTGAAAAATGGGCTTTTAAATGTGAAAACGGCTGGAGAACTCAAATTTTTTCATTGAAAATCTGTGAAAAT
+
IIHGHGFGFIFGIFEEEIEDDDDDEDBDCEBECDCBBBC@EFBB@CCACB@@AAAB?@BA@F@@A?AC?D?BA@??BABBBA?B>A@@???><?>><@C?@??@>?==@=D?>??=@>=><<@=>>;>@>>=@=><>;>>==<@?===>==
@gi|453232067|ref|NC_003281.10|_1514032_1513831_1_0_0_0_0:0:0_0:0:0_74604 BX:Z:TATATCCTCTAGCTAG-1
AAAAAAATGCTTTTCTTTGAAATTTTTTTTTTTTCATTATTTTTTTGTTTTTATCAATTTTCATGCTTCTTTTCACCAATTTTTCTTACAAAAACCGCAAAAACCGCGTTTTTCCGTGTTTGCGTACT
+
HBGGIHGFFEEDDCCH@B?CEDBDEC@CBBBB=?BCBA@BDAADABBA@B@>@@D@@A@B>?@@@@>>@;@?B?ABB<?<???<?>@=>>B?>=?;?>C<@>A<B=>A?=;=>@<A=>>?:><><?=@
@gi|453232067|ref|NC_003281.10|_1514032_1513831_1_0_0_0_0:0:0_0:0:0_74604 BX:Z:TATATCCTCTAGCTAG-1
AAATAAATAAATTTTCGAAAAAAAAAATTTTTTTTTTGAAAATTTTTGAAATTTTTTTTTTTCAAACATTTGAAATCTAACCAATTTTTATCGTCATAATTTTCGAATTTCCCACTCAATTCTACCGATTTCCCCATATTCCGGCAATTTT
+
IIIIIGFHCFFIIFDIFFECABEEGBCFCEE@CCGCCEA@DBDE@BC@AB>AABBA?AAA@B@DB@@?@?DBDC=A@@?<CA@?@B>A?>@?????B?=@>?@>>>@??@@<@A>B?B>@@>>??>?<><>;?=<@=>==@=@<<;<A=>=
@gi|453232767|ref|NC_003283.11|_18849370_18849536_0_1_0_0_0:0:0_0:0:0_f7080 BX:Z:TTATCCAGTTGGGCAA-1
CCAAATTTTAAGAATAGGTCGCAGGTTCGAGTCCCGACGGGGCGCAATTTTTTTTTGACTTTTTAAAGTCTTTTGACTATTTACTGAAATAATTTTTTTGCAATGCGAAGGAAATTTCAAAAAGTTTT
+
FFDGGEDEEHGEECDDBDEDCEDCDBDCECAABB@@B>ADBBB?ABAA@C??@A>ACB@BB@B?CA@DDA>@>B>@@;?AD=???=<<>>>A>>>>>=>>>>?><=@@>A>><=>==?>=A<=?>A=A
@gi|453232767|ref|NC_003283.11|_18849370_18849536_0_1_0_0_0:0:0_0:0:0_f7080 BX:Z:TTATCCAGTTGGGCAA-1




#######
# ARBitR
# https://github.com/markhilt/ARBitR
git clone https://github.com/markhilt/ARBitR.git
python -m pip install scipy
python -m pip install pysam
python -m pip install mappy
python -m pip install pandas
python -m pip install multiprocessing

# test run
python3 arbitr.py -m 12000 -s 5000 -i ecoli.broken.fasta -o ecoli.test_data ecoli.broken.bam
# runs
python3 ../src/arbitr.py -m 12000 -s 5000 -i ecoli.broken.fasta -o ecoli.test_data ecoli.broken.
bam
[Sun Dec 13 21:01:03 2020]      Starting ARBitR.
[Sun Dec 13 21:01:03 2020]      Collecting contigs.
[Sun Dec 13 21:01:03 2020]      Collecting barcodes for linkgraph.
[Sun Dec 13 21:01:03 2020]      Starting barcode collection. Found 10 contigs.
[Sun Dec 13 21:01:04 2020]      [ BARCODE COLLECTION ]  Completed: 100.0% (20 out of 20)
[Sun Dec 13 21:01:04 2020]      Creating link graph.
[Sun Dec 13 21:01:04 2020]      [ BARCODE COMPARISON ]  Completed: 100.0% (19 out of 19)
[Sun Dec 13 21:01:04 2020]      Number of windows: 19
[Sun Dec 13 21:01:04 2020]      [ BARCODE LINKING ]     Completed: 100.0% (19 out of 19)
[Sun Dec 13 21:01:04 2020]      Writing link graph to ecoli.test_data.backbone.gfa.
[Sun Dec 13 21:01:04 2020]      Finding paths.
[Sun Dec 13 21:01:04 2020]      Found 1 paths.
[Sun Dec 13 21:01:04 2020]      Collecting barcodes from short contigs.
[Sun Dec 13 21:01:04 2020]      Starting barcode collection. Found 5 contigs.
[Sun Dec 13 21:01:04 2020]      [ BARCODE COLLECTION ]  Completed: 100.0% (5 out of 5)
[Sun Dec 13 21:01:04 2020]      [ PATH FILLING ]        Completed: 100.0% (1 out of 1)
[Sun Dec 13 21:01:04 2020]      Found fasta file for merging: ecoli.broken.fasta
[Sun Dec 13 21:01:04 2020]      Trimming contig ends...
[Sun Dec 13 21:01:05 2020]      [ TRIMMING ]    Completed: 100.0% (1 out of 1)
[Sun Dec 13 21:01:05 2020]      Creating scaffolds...
[Sun Dec 13 21:01:05 2020]      Number of paths: 1
[Sun Dec 13 21:01:23 2020]      [ SCAFFOLDING ] Completed: 100.0% (1 out of 1)
[Sun Dec 13 21:01:23 2020]      Scaffolding completed.
[Sun Dec 13 21:01:23 2020]      Number of aligned merges: 12
[Sun Dec 13 21:01:23 2020]      Number of gaps introduced: 1
[Sun Dec 13 21:01:23 2020]      Collecting leftover sequences.
[Sun Dec 13 21:01:23 2020]      Writing merged fasta to ecoli.test_data.fasta
[Sun Dec 13 21:01:23 2020]      ARBitR successfully completed!

cd /mnt/griffin/chrwhe/Polygonia_calbum/10x/arcs/ARBitR

# convert sam to bam
samtools view -b -S Pcalbum_10X.sam > Pcalbum_10X.bam
samtools sort -@ 20 -m 2000M Pcalbum_10X.bam -o Pcalbum_10X.sorted.bam
samtools index Pcalbum_10X.sorted.bam

/mnt/griffin/chrwhe/software/ARBitR/src/
export PATH=/mnt/griffin/chrwhe/software/ARBitR/src/:$PATH

# /mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py -i <in.fasta> <in.bam> # Builds the linkgraph and uses it to merge the contigs in <in.fasta>
python3 arbitr.py -m 45000 -s 5000 -i Polygonia-scaffolds.fa -o Pcalbum_10X Pcalbum_10X.sorted.bam # Builds the linkgraph and uses it to merge the contigs in <in.fasta>

python3 /mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py -m 45000 -s 5000 -i Polygonia-scaffolds.fa -o Pcalbum_10X Pcalbum_10X.sorted.bam # Builds the linkgraph and uses it to merge the contigs in <in.fasta>
[Sun Dec 13 21:09:47 2020]      Starting ARBitR.
[Sun Dec 13 21:09:48 2020]      Collecting contigs.
[Sun Dec 13 21:09:48 2020]      Collecting barcodes for linkgraph.
[Sun Dec 13 21:09:49 2020]      Starting barcode collection. Found 1016 contigs.
[Sun Dec 13 21:10:23 2020]      [ BARCODE COLLECTION ]  Completed: 100.0% (2032 out of 2032)
[Sun Dec 13 21:10:24 2020]      Creating link graph.
Traceback (most recent call last):
  File "/mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py", line 250, in <module>
    main()
  File "/mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py", line 194, in main
    barcode_fraction)
  File "/mnt/griffin/chrwhe/software/ARBitR/src/graph_building.py", line 507, in main
    GEMcomparison = pairwise_comparisons(GEMlist)
  File "/mnt/griffin/chrwhe/software/ARBitR/src/graph_building.py", line 390, in pairwise_comparisons
    misc.printstatus("[ BARCODE COMPARISON ]\t" + misc.reportProgress(idx+1, len(GEMlist)))
  File "/mnt/griffin/chrwhe/software/ARBitR/src/misc.py", line 29, in reportProgress
    return "Completed: {0}% ({1} out of {2})".format( str(round( (current / total) * 100, 2)), current, total)
ZeroDivisionError: division by zero

python /mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py -m 45000 -s 5000 -i Polygonia-scaffolds.fa -o Pcalbum_10X Pcalbum_10X.sorted.bam # Builds the linkgraph and uses it to merge the contigs in <in.fasta>
Traceback (most recent call last):
  File "/mnt/griffin/chrwhe/software/ARBitR/src/arbitr.py", line 25, in <module>
    import graph_building
  File "/mnt/griffin/chrwhe/software/ARBitR/src/graph_building.py", line 18, in <module>
    import misc
  File "/mnt/griffin/chrwhe/software/ARBitR/src/misc.py", line 26
    print("[{}]\t{}".format(now, msg), end="\r", flush=True)
                                          ^
SyntaxError: invalid syntax
