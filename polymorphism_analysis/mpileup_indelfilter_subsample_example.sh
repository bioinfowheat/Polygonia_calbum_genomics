
##########
#
# here are examples of taking a bam file through to mpileup
# then indel filtering the mpileup
# then subsampling the file based upon max and min read coverage thresholds.


# making mpileup
/data/programs/samtools-1.2/samtools mpileup -B combined_highlow_Lful90_mespaAll.sorted.bam > combined_highlow_Lful90_mespaAll.sorted.mpileup

##########
# indel filtering
# pileup ending in ".mpileup", which is here removed.
pileup=combined_highlow_Lful90_mespaAll.sorted
#
perl /data/programs/popoolation/basic-pipeline/identify-genomic-indel-regions.pl --input $pileup.mpileup --output $pileup.indel.gtf --indel-window 5 --min-count 1
# remove indels
perl /data/programs/popoolation/basic-pipeline/filter-pileup-by-gtf.pl  --gtf $pileup.indel.gtf --input $pileup.mpileup --output $pileup.rmindel.pileup
# now make sure that you are only taking rows that have 6 columns, as if they lack this due to having too little data, it will crash PoolHMM
awk '{if(NF==6){print $0}}' $pileup.rmindel.pileup > $pileup.rmindel.6col.pileup
# be sure to check the wc -l of the before and after mpileup to see what things look like, also look at the head of each, etc.

##########
# # then subset the data to an appropriate depth ... need to look at the distribution of read depths across large part of the genome
# assessing depth
# before subsample
cut -f4 combined_highlow_Lful90_mespaAll.sorted.mpileup | head -100000 | csvstat

Mean: 28.1293712937
Median: 29
Standard Deviation: 10.5704905557

# should also look at a histogram of the read depth

# pileup_file=combined_highlow.sorted.mpileup.rmindel.p_filt.pileup
pileup_file=combined_highlow_Lful90_mespaAll.sorted.rmindel.6col.pileup
targetcoverage_subsample=20
maxcoverage_subsample=80
# then subset the data
perl /data/programs/popoolation/basic-pipeline/subsample-pileup.pl --input $pileup_file --output $pileup_file.subsampled.pileup --target-coverage $targetcoverage_subsample --max-coverage $maxcoverage_subsample --method withoutreplace --fastq-type sanger

# after subsample, sanity check
cut -f4 combined_highlow_Lful90_mespaAll.sorted.rmindel.6col.pileup.subsampled.pileup | head -100000 | csvstat
