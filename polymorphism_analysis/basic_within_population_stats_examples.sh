

# mpileup file
# note that for Tajima's D, one should use a subsamled file.
# also, ideally this should be a bam file that was perviously filtered for mapq and pairs


#



# analysis using parallel scripts
# pi
pileup_file=Lpul2019_combined_highlow.sorted.mpileup.rmindel.6col.pileup
maxdepth=300
poolsize=137
window=50000
metric=pi
outfile=$pileup_file."$metric"."$window"
/data/programs/scripts/popoolation_parallel_scripts/parallel_variance_sliding_pi_D.sh 50 $pileup_file $outfile $maxdepth $poolsize $window $window $metric sanger

# d
pileup_file=Lpul2019_combined_highlow.sorted.mpileup.rmindel.6col.pileup
maxdepth=300
poolsize=137
window=50000
metric=D
outfile=$pileup_file."$metric"."$window"
/data/programs/scripts/popoolation_parallel_scripts/parallel_variance_sliding_pi_D.sh 50 $pileup_file $outfile $maxdepth $poolsize $window $window $metric sanger
