# using RED

mkdir masking
cd masking/
mkdir genome
cd genome
ln -s /mnt/griffin/chrwhe/Pc_album/10x/Scaffolds_pass1.fa .
cd ..
mkdir masked_out
mkdir repeats_out

# The following command runs Red with the defaults and generates the masked sequences and the locations of the repeats found in the whole genome.
#
# Red -gnm genome_directory -msk output_directory -rpt output_directory


/data/programs/RED/redUnix64/Red -gnm genome -msk masked_out -rpt repeats_out -frm 2
