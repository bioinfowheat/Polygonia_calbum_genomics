
# running on gz. Thus make sure that your raw fastq file is in gz format
# e.g.
# pigz *fastq

# in your data file folder with the gz compressed fastq files
mkdir cleaning
cd cleaning

# put your fastq files in this folder, or soft link

#make file of the file names
ls *gz > fastq.gz_raw

# NOTE that this should be a list of paired read 1 and read 2 fastq files
# these shoudl always be the same data, read1 then read2, in the list.
# so the list shoudl always be divisible by 2, etc.

# run the cleaning script on this subset of files where their paths are indicated
python /data/programs/scripts/getlog_dna_gzfastq_q20_v25_8_20.py  fastq.gz_raw


# then look at the summary stats, for clones and trimming, etc.


Input:                          601267070 reads                 90757256871 bases.
Contaminants:                   3268 reads (0.00%)      493344 bases (0.00%)
QTrimmed:                       276637183 reads (46.01%)        16510150403 bases (18.19%)
Result:                         524922876 reads (87.30%)        74246613124 bases (81.81%)

Time:                           1244.136 seconds.
Reads Processed:        601m    483.28k reads/sec
Bases Processed:      90757m    72.95m bases/sec
