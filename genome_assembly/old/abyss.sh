cd /mnt/griffin/chrwhe/Polygonia_calbum/abyss


# notes for optimizing k
for k in `seq 50 8 90`; do
	mkdir k$k
	abyss-pe -C k$k name=ecoli k=$k in=../reads.fa
done
abyss-fac k*/ecoli-contigs.fa

# files

Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq
Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq
Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_1.fq.gz
Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_2.fq.gz


# example
abyss-pe k=96 name=ecoli lib='pea peb' mp='mpc mpd' \
	pea='pea_1.fa pea_2.fa' peb='peb_1.fa peb_2.fa' \
	mpc='mpc_1.fa mpc_2.fa' mpd='mpd_1.fa mpd_2.fa'

# paper example
abyss-pe name = hsapiens np = 64 k = 144 q = 15 v = -v l = 40 s = 1000 n = 10 
S = 1000–10 000 N = 7 mp6k_de=–mean mp6k_n = 1
#lib = pe400 mp = mp6k, where pe400 and mp6k are variables listing all files containing paired-end sequencing and MPET reads.
np: number of MPI processes [1]
k: size of k-mer
q: minimum base quality [3]
l: minimum alignment length of a read (bp) [40]
s: minimum unitig size required for building contigs (bp) [1000]
n: minimum number of pairs required for building contigs [10]
S: minimum contig size required for building scaffolds (bp) [1000-10000]
N: minimum number of pairs required for building scaffolds [n]


export TMPDIR=//mnt/griffin/chrwhe/Polygonia_calbum/abyss/tmp

abyss-pe k=96 np=50 q = 15 N = 7 \
name=Polygonia lib='pea' mp='mpb' \
pea='Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq' \
mpb='Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_1.fq.gz Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_2.fq.gz'

abyss-stack-size 65536 PathConsensus  --dot -k96  -p0.9  -s Polygonia-7.fa -g Polygonia-7.dot -o Polygonia-7.path Polygonia-6.fa Polygonia-6.dot Polygonia-6.path
Running with max stack size of 65536 KB: PathConsensus --dot -k96 -p0.9 -s Polygonia-7.fa -g Polygonia-7.dot -o Polygonia-7.path Polygonia-6.fa Polygonia-6.dot Polygonia-6.path
Ambiguous paths: 51517
Merged:          11054
No paths:        20791
Too many paths:  1046
Too complex:     14643
Dissimilar:      3983
cat Polygonia-6.fa Polygonia-7.fa \
        | MergeContigs   -k96 -o Polygonia-8.fa - Polygonia-7.dot Polygonia-7.path
The minimum coverage of single-end contigs is 1.65169.
The minimum coverage of merged contigs is 4.59375.
Consider increasing the coverage threshold parameter, c, to 4.59375.
ln -sf Polygonia-8.fa Polygonia-scaffolds.fa
PathOverlap --overlap   -k96 --dot Polygonia-7.dot Polygonia-7.path >Polygonia-8.dot
ln -sf Polygonia-8.dot Polygonia-scaffolds.dot
abyss-fac   Polygonia-unitigs.fa Polygonia-contigs.fa Polygonia-scaffolds.fa |tee Polygonia-stats.tab
n       n:500   L50     min     N75     N50     N25     E-size  max     sum     name
624188  191295  24339   500     1246    3230    8647    6787    112134  371e6   Polygonia-unitigs.fa
600774  184542  22145   500     1304    3527    9594    7512    112134  372e6   Polygonia-contigs.fa
517438  123492  638     500     2105    61962   468323  321447  2205243 371.1e6 Polygonia-scaffolds.fa
ln -sf Polygonia-stats.tab Polygonia-stats
tr '\t' , <Polygonia-stats.tab >Polygonia-stats.csv
abyss-tabtomd Polygonia-stats.tab >Polygonia-stats.md

/data/programs/scripts/AsmQC Polygonia-scaffolds.fa
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
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa

/mnt/griffin/racste/Software/seqkit stats *.fa  -a
file                    format  type   num_seqs      sum_len  min_len  avg_len    max_len   Q1     Q2     Q3  sum_gap     N50  Q20(%)  Q30(%)
Polygonia-contigs.fa    FASTA   DNA     600,774  457,393,018       96    761.3    112,134  141    244    633        0   2,189       0       0
Polygonia-scaffolds.fa  FASTA   DNA     517,438  488,184,032       96    943.5  2,274,482  136    216    479        0  24,994       0       0
Polygonia-unitigs.fa    FASTA   DNA     624,188  459,097,801       96    735.5    112,134  135    241    633        0   1,994       0       0

cd /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/busco
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_96/Polygonia-scaffolds.fa Polygonia-scaffolds_96.fa

export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
#
genome=Polygonia-scaffolds_96.fa
library=lepidoptera_odb10
outfile=Polygonia-scaffolds_96_v_lepidoptera_odb10

# Run BUSCO
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

--------------------------------------------------
|Results from dataset lepidoptera_odb10           |
--------------------------------------------------
|C:89.0%[S:88.2%,D:0.8%],F:5.3%,M:5.7%,n:5286     |
|4701   Complete BUSCOs (C)                       |
|4660   Complete and single-copy BUSCOs (S)       |
|41     Complete and duplicated BUSCOs (D)        |
|279    Fragmented BUSCOs (F)                     |
|306    Missing BUSCOs (M)                        |
|5286   Total BUSCO groups searched               |
--------------------------------------------------

# compared to P8516_202_bc070_v_lepidoptera_odb10
# 96
|C:87.1%[S:85.2%,D:1.9%],F:6.5%,M:6.4%,n:5286     |
# 64
|C:86.1%[S:85.7%,D:0.4%],F:6.3%,M:7.6%,n:5286     |


# thus this abyss assembly might be a better starting point!!!!

#################################
cd abyss_64

ln -s ../10x/*gz .
ln -s ../polishing/*fq .

export TMPDIR=/mnt/griffin/chrwhe/Polygonia_calbum/abyss_144/tmp

abyss-pe k=64 np=50 q = 15 N = 7 \
	name=Polygonia lib='pea' mp='mpb' \
	pea='Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_1.ctq.fq.ctq20.fq Polygonia_c-album.SWE.15.Stockholm.sib2_01_Sep_2015.Pupa.1_2.ctq.fq.ctq20.fq' \
	mpb='Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_1.fq.gz Polygonia_c-album.SWE.2015.Inbred_lineSib2_female2_Stockholm.170704_isolation_MP3kb.pupa.nextclipABC_2.fq.gz'

#
The minimum coverage of single-end contigs is 5.33333.
The minimum coverage of merged contigs is 6.16477.
Consider increasing the coverage threshold parameter, c, to 6.16477.
# matepair assessment
Building the character occurrence table...
Mateless          0
Unaligned    534065  0.705%
Singleton   8925808  11.8%
FR           236984  0.313%
RF         10636157  14%
FF           850550  1.12%
Different  54595217  72%
# is this the way it wants? or was it looking for FR and RF?
abyss-scaffold    -k64 -s1000-10000 -n10 -g Polygonia-6.path.dot  Polygonia-6.dot mpb-6.dist.dot >Polygonia-6.path
warning: Removed 4234 invalid edges.
n       n:1000  L50     min     N75     N50     N25     E-size  max     sum     name
975692  18980   366     1000    24892   136848  350976  248753  1871165 235.4e6 n=10 s=1000
1001766 45054   790     1000    3196    49454   196512  126577  993734  233.3e6 n=10 s=2000
1027452 70740   9886    1000    2151    4064    20761   21345   434110  237.4e6 n=10 s=5000
1032553 75841   14639   1000    2169    4125    8145    8910    242876  240.2e6 n=10 s=10000

Best scaffold N50 is 136848 at n=10 s=1000.

n       n:1000  L50     min     N75     N50     N25     E-size  max     sum     name
975692  18980   366     1000    24892   136848  350976  248753  1871165 235.4e6 n=10 s=1000
abyss-stack-size 65536 PathConsensus  --dot -k64  -p0.9  -s Polygonia-7.fa -g Polygonia-7.dot -o Polygonia-7.path Polygonia-6.fa Polygonia-6.dot Polygonia-6.path
Running with max stack size of 65536 KB: PathConsensus --dot -k64 -p0.9 -s Polygonia-7.fa -g Polygonia-7.dot -o Polygonia-7.path Polygonia-6.fa Polygonia-6.dot Polygonia-6.path
Ambiguous paths: 55139
Merged:          6117
No paths:        25071
Too many paths:  935
Too complex:     19287
Dissimilar:      3729
cat Polygonia-6.fa Polygonia-7.fa \
        | MergeContigs   -k64 -o Polygonia-8.fa - Polygonia-7.dot Polygonia-7.path
The minimum coverage of single-end contigs is 2.22222.
The minimum coverage of merged contigs is 6.38889.
Consider increasing the coverage threshold parameter, c, to 6.38889.
ln -sf Polygonia-8.fa Polygonia-scaffolds.fa
PathOverlap --overlap   -k64 --dot Polygonia-7.dot Polygonia-7.path >Polygonia-8.dot
ln -sf Polygonia-8.dot Polygonia-scaffolds.dot
abyss-fac   Polygonia-unitigs.fa Polygonia-contigs.fa Polygonia-scaffolds.fa |tee Polygonia-stats.tab
n       n:500   L50     min     N75     N50     N25     E-size  max     sum     name
1119171 181728  29122   500     1091    2505    5542    4374    51981   302e6   Polygonia-unitigs.fa
1033255 170118  24519   500     1197    2942    6752    5251    78536   304.7e6 Polygonia-contigs.fa
957363  111319  697     500     1922    65759   302352  204375  1928876 304.8e6 Polygonia-scaffolds.fa
ln -sf Polygonia-stats.tab Polygonia-stats
tr '\t' , <Polygonia-stats.tab >Polygonia-stats.csv
abyss-tabtomd Polygonia-stats.tab >Polygonia-stats.md

-------------------------------
    AssemblyQC Result
-------------------------------
Contigs Generated :      957,363
Maximum Contig Length : 1,974,795
Minimum Contig Length :       64
Average Contig Length :    503.5 ±  8,677.5
Median Contig Length :      77.0
Total Contigs Length :  482,079,299
Total Number of Non-ATGC Characters :   36,874,005
Percentage of Non-ATGC Characters :        7.649
Contigs >= 100 bp :      677,141
Contigs >= 200 bp :      343,421
Contigs >= 500 bp :      111,319
Contigs >= 1 Kbp :        18,907
Contigs >= 10 Kbp :        3,476
Contigs >= 1 Mbp :             8
N50 value :       10,397
Generated using /mnt/griffin/chrwhe/Polygonia_calbum/abyss_64/Polygonia-scaffolds.fa




cd /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/busco
ln -s /mnt/griffin/chrwhe/Polygonia_calbum/abyss_64/Polygonia-scaffolds.fa Polygonia-scaffolds_64.fa

export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
#
genome=Polygonia-scaffolds_64.fa
library=lepidoptera_odb10
outfile=Polygonia-scaffolds_64_v_lepidoptera_odb10

# Run BUSCO
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

--------------------------------------------------
|Results from dataset lepidoptera_odb10           |
--------------------------------------------------
|C:86.1%[S:85.7%,D:0.4%],F:6.3%,M:7.6%,n:5286     |
|4551   Complete BUSCOs (C)                       |
|4530   Complete and single-copy BUSCOs (S)       |
|21     Complete and duplicated BUSCOs (D)        |
|331    Fragmented BUSCOs (F)                     |
|404    Missing BUSCOs (M)                        |
|5286   Total BUSCO groups searched               |
--------------------------------------------------
