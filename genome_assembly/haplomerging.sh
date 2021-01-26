# mask genome
# using RED
cd /mnt/griffin/chrwhe/Pc_album
mkdir masking
cd masking/
mkdir genome
cd genome
ln -s /mnt/griffin/chrwhe/Pc_album/10x/Scaffolds_pass1.fa .
cd ..
mkdir masked_out
mkdir repeats_out
# shoudl output in tab format
/mnt/griffin/chrwhe/software/redUnix64/Red -gnm genome -msk masked_out -rpt repeats_out -frm 2

# check
/data/programs/scripts/AsmQC /mnt/griffin/chrwhe/Pc_album/masking/masked_out/Scaffolds_pass1.msk
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
Generated using /mnt/griffin/chrwhe/Pc_album/masking/masked_out/Scaffolds_pass1.msk


cd /mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1
# masked genome for haplomerge
ln -s /mnt/griffin/chrwhe/Pc_album/masking/masked_out/Scaffolds_pass1.msk Pc_album.mpss.masked.fa

# clean the genome
in=Pc_album.mpss.masked.fa
out=Pc_album.mpss.masked.cleaned.fa
cat $in | //mnt/griffin/chrwhe/software/HaploMerger2_20180603/bin/faDnaPolishing.pl --legalizing \
 --maskShortPortion=1 --noLeadingN --removeShortSeq=1 > $out

# set up haplomerger run
# do this in my software folder as paths are done, and these are a bit complicated
cd /mnt/griffin/chrwhe/software/HaploMerger2_20180603
mkdir Pc_album_haplomerger_run1
cd Pc_album_haplomerger_run1
cp ../project_template/hm.batchB* ./ ; cp ../project_template/hm.batchA* ./ ; cp ../project_template/hm.batchD* ./
# changed all these that could be changed, from core = 1 to core = 32
cp ../project_template/all_lastz.ctl ./ ; cp ../project_template/scoreMatrix.q ./ ; cp ../project_example2/run_all_ed.batch ./

# get the masked genome and rename genome.fa
cp Pc_album.mpss.masked.cleaned.fa genome.fa
# zip it
gzip genome.fa
# run
sh ./run_all_ed.batch >run_all_ed.log 2>&1

# genome_A.fa.gz ## the diploid assembly with misjoins removed
# genome_A_ref.fa.gz ## the reference haploid assembly
# genome_A_alt.fa.gz ## the alternative haploid assembly
# genome_A_ref_D.fa.gz ## the reference assembly with tandems removed

zcat genome_A_ref.fa.gz > Pc_album.mpss.cln.msk.haploidA.fa
zcat genome_A_ref_D.fa.gz > Pc_album.mpss.cln.msk.haploidA.tndrm.fa
zcat genome.fa.gz > Pc_album.mpss.cln.msk.fa

/data/programs/scripts/AsmQC Pc_album.mpss.cln.msk.fa
Contigs Generated :       30,132
Maximum Contig Length : 3,782,336
Minimum Contig Length :    1,000
Average Contig Length : 13,754.0 ± 96,058.6
Median Contig Length :   2,422.5
Total Contigs Length :  414,435,097
Total Number of Non-ATGC Characters :   46,241,697
Percentage of Non-ATGC Characters :       11.158
Contigs >= 100 bp :       30,132
Contigs >= 200 bp :       30,132
Contigs >= 500 bp :       30,132
Contigs >= 1 Kbp :        30,132
Contigs >= 10 Kbp :        1,307
Contigs >= 1 Mbp :            70
N50 value :      519,132

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


export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
#
genome=Pc_album.mpss.cln.msk.haploidA.fa
library=lepidoptera_odb10
outfile=Pc_album.mpss.cln.msk.haploidA_v_lepidoptera_odb10

# Run BUSCO
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

--------------------------------------------------
|Results from dataset lepidoptera_odb10           |
--------------------------------------------------
|C:90.4%[S:90.1%,D:0.3%],F:4.7%,M:4.9%,n:5286     |
|4782   Complete BUSCOs (C)                       |
|4765   Complete and single-copy BUSCOs (S)       |
|17     Complete and duplicated BUSCOs (D)        |
|248    Fragmented BUSCOs (F)                     |
|256    Missing BUSCOs (M)                        |
|5286   Total BUSCO groups searched               |
--------------------------------------------------

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

# check the gene content
########
# BUSCO
# define paths
cd /mnt/griffin/chrwhe/Pc_album
mkdir busco
cd busco
export PATH=$PATH:/data/programs/bbmap_34.94/:/data/programs/augustus-3.0.1/bin:/data/programs/augustus-3.0.1/scripts
AUGUSTUS_CONFIG_PATH=/data/programs/augustus-3.0.1/config
genome=/mnt/griffin/chrwhe/software/HaploMerger2_20180603/Pc_album_haplomerger_run1/Pc_album.mpss.cln.msk.haploidA.tndrm.fa
library=/data/programs/busco/insecta_odb9
outfile=Pc_album.mpss.cln.msk.haploidA.tndrm.insectaBUSCO	C:89.3%[S:88.6%,D:0.7%],F:7.2%,M:3.5%,n:1658
		1480 Complete BUSCOs (C)
		1469 Complete and single-copy BUSCOs (S)
		11 Complete and duplicated BUSCOs (D)
		120 Fragmented BUSCOs (F)
		58 Missing BUSCOs (M)
		1658 Total BUSCO groups searched
python /data/programs/busco/scripts/run_BUSCO.py -i $genome -l $library -m genome -o $outfile -c 64
