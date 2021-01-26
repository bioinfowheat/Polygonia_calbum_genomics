/data/programs/scripts/AsmQC P8516_202_bc070.fasta
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       45,961
Maximum Contig Length : 1,555,337
Minimum Contig Length :    1,000
Average Contig Length :  8,777.2 ± 36,312.8
Median Contig Length :   1,030.0
Total Contigs Length :  403,406,854
Total Number of Non-ATGC Characters :   35,031,480
Percentage of Non-ATGC Characters :        8.684
Contigs >= 100 bp :       45,961
Contigs >= 200 bp :       45,961
Contigs >= 500 bp :       45,961
Contigs >= 1 Kbp :        45,961
Contigs >= 10 Kbp :        4,384
Contigs >= 1 Mbp :             3
N50 value :       76,482
Generated using /mnt/griffin/chrwhe/Pc_album/10x/P8516_202_bc070.fasta




# MP data
cp /mnt/reads2/compressed/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.1_1.fq.gz .
cp /mnt/reads2/compressed/Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.1_2.fq.gz .
unpigz *gz

wc -l Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.1_1.fq
1211067400 Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.1_1.fq
311067400

/data/programs/nextclip/bin/nextclip -i Polygonia_c*.1_1.fq -j Polygonia_c*.1_2.fq -n 311067400 -o Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa --min_length 50 --trim_ends 0

        Number of read pairs: 302766850
   Number of duplicate pairs: 115753014 38.23 %
Number of pairs containing N: 5182701   1.71 %

   R1 Num reads with adaptor: 214260282 70.77 %
   R1 Num with external also: 56104275  18.53 %
       R1 long adaptor reads: 102590665 33.88 %
          R1 reads too short: 111669617 36.88 %
     R1 Num reads no adaptor: 88506568  29.23 %
  R1 no adaptor but external: 7353696   2.43 %

   R2 Num reads with adaptor: 205583429 67.90 %
   R2 Num with external also: 54351274  17.95 %
       R2 long adaptor reads: 93960361  31.03 %
          R2 reads too short: 111623068 36.87 %
     R2 Num reads no adaptor: 97183421  32.10 %
  R2 no adaptor but external: 7506640   2.48 %

   Total pairs in category A: 145049478 47.91 %
         A pairs long enough: 31291814  10.34 %
           A pairs too short: 113757664 37.57 %
A external clip in 1 or both: 12099     0.00 %
     A bases before clipping: 43804942356
       A total bases written: 5198539237

   Total pairs in category B: 60533951  19.99 %
         B pairs long enough: 19968915  6.60 %
           B pairs too short: 40565036  13.40 %
B external clip in 1 or both: 162971    0.05 %
     B bases before clipping: 18281253202
       B total bases written: 4644303262

   Total pairs in category C: 69210804  22.86 %
         C pairs long enough: 24518052  8.10 %
           C pairs too short: 44692752  14.76 %
C external clip in 1 or both: 558330    0.18 %
     C bases before clipping: 20901662808
       C total bases written: 5726076882

   Total pairs in category D: 27972617  9.24 %
         D pairs long enough: 21747613  7.18 %
           D pairs too short: 6225004   2.06 %
D external clip in 1 or both: 7350218   2.43 %
     D bases before clipping: 8447730334
       D total bases written: 6450841916

          Total usable pairs: 75778781  25.03 %
             All long enough: 97526394  32.21 %
    All categories too short: 205240456 67.79 %
      Duplicates not written: 0 0.00 %
          Overall GC content: 36.53 %

# mapping to genome
libA=Polygonia_c-album*.nextclipABC_1.fq
libB=Polygonia_c-album*.nextclipABC_2.fq
ref=P8516_202_bc070.fasta
folder_path=/mnt/griffin/chrwhe/Pc_album/10x/
besst_script_path=/data/programs/BESST.v2.0/scripts

# python $besst_script_path/reads_to_ctg_map.py --norebuildindex --threads 30 --tmp_path $folder_path $folder_path/$libA $folder_path/$libB $folder_path/$ref $folder_path
python $besst_script_path/reads_to_ctg_map.py --norebuildindex --threads 30 $libA $libB $ref $folder_path


samtools sort output.sam.bam Pcalbum_MP.sorted
samtools index Pcalbum_MP.sorted.bam

ref=P8516_202_bc070.fasta
folder_path=/mnt/griffin/chrwhe/Pc_album/10x/
# /data/programs/BESST.v2.0/runBESST /path/to/contigfile.fa -f /path/to/file1.bam /path/to/file2.bam ... -o /path/to/output -orientation {fr/rf}
/data/programs/BESST.v2.0/runBESST -c $ref -f Pcalbum_MP.sorted.bam -o $folder_path -orientation rf --iter 1000000

Mode on getdistr adjusted:  2719
Median on getdistr adjusted: 3487

mean_coverage   34.147850136
detect_duplicate        True
L50:  205 N50:  539533 Initial contig assembly length:  403406854
Total time for scaffolding: 2588.90936303


# result
# BESST scaffolded
ln -s /mnt/griffin/chrwhe/Pc_album/10x/BESST_output/pass1/Scaffolds_pass1.fa .
-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :       30,132
Maximum Contig Length : 3,782,336
Minimum Contig Length :    1,000
Average Contig Length : 13,754.0 ± 96,058.6
Median Contig Length :   2,422.5
Total Contigs Length :  414,435,107
Total Number of Non-ATGC Characters :   46,241,706
Percentage of Non-ATGC Characters :       11.158
Contigs >= 100 bp :       30,132
Contigs >= 200 bp :       30,132
Contigs >= 500 bp :       30,132
Contigs >= 1 Kbp :        30,132
Contigs >= 10 Kbp :        1,307
Contigs >= 1 Mbp :            70
N50 value :      519,132
Generated using /mnt/griffin/chrwhe/Pc_album/10x/Scaffolds_pass1.fa
