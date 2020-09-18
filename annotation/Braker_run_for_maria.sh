# troubleshooting with Maria

cd /mnt/griffin/marcel/Pca_genome
mkdir braker2_test_cww

ln -s /mnt/griffin/marcel/Pca_genome/masking/Pc_album_NGM_masked.softmasked.fa .
cp ../braker2_test/odb10_arthropoda_proteins.fa .





genome=Pc_album_NGM_masked.softmasked.fa
proteins=odb10_arthropoda_proteins.fa

###########
# now set up the other dependencies.

# install a local "key" for running the gmes Gene Mark software in your local home folder
# get the key
cp /data/programs/scripts/gm_key_64 gm_key
# put it in your home folder using this script
cp gm_key ~/.gm_key

###########
# you should be able to copy and paste that below, from 'your_working_dir=$(pwd)' down to 'braker.pl ...'
# and run braker
###########

genome=Pc_album_NGM_masked.softmasked.fa
proteins=odb10_arthropoda_proteins.fa

# first this makes an augustus config file in your local folder that augustus needs to be able to write to
your_working_dir=$(pwd)
cp -r /data/programs/Augustus_v3.3.3/config/ $your_working_dir/augustus_config
export AUGUSTUS_CONFIG_PATH=$your_working_dir/augustus_config
chmod -R 777 $your_working_dir/augustus_config

# now set paths to the other tools
export PATH=/data/programs/BRAKER2_v2.1.5/scripts/:$PATH
export AUGUSTUS_BIN_PATH=/data/programs/Augustus_v3.3.3/bin
export AUGUSTUS_SCRIPTS_PATH=/data/programs/Augustus_v3.3.3/scripts
export DIAMOND_PATH=/data/programs/diamond_v0.9.24/
export GENEMARK_PATH=/data/programs/gmes_linux_64.4.61_lic/
export BAMTOOLS_PATH=/data/programs/bamtools-2.5.1/bin/
export PROTHINT_PATH=/data/programs/ProtHint/bin/
export ALIGNMENT_TOOL_PATH=/data/programs/gth-1.7.0-Linux_x86_64-64bit/bin
export SAMTOOLS_PATH=/data/programs/samtools-1.10/
export MAKEHUB_PATH=/data/programs/MakeHub/

# braker.pl --genome=$genome --prot_seq=$proteins --softmasking --cores=30

# for using also the bam files for RNAseq
# ls *bam | sed 's/.bam/.bam,/g' | tr "\n" " "| sed 's/ //g' > bam_files.csv

# I then copied this list to clipboard, pasted it here, and made sure to remove all of the tab and other blank spaces, so that
# this is one complete line

bamfiles=A_14D_rep3.aln.sorted.bam,A_DAE_rep4.aln.sorted.bam,A_EOD_rep2.aln.sorted.bam,A_MOD_rep2.aln.sorted.bam,A_RAD_rep2.aln.sorted.bam,EE_seventeenrep1.aln.sorted.bam,EE_seventeenrep2.aln.sorted.bam,EE_seventeenrep3.aln.sorted.bam,EN_seventeenrep1.aln.sorted.bam,EN_tworep1.aln.sorted.bam,EN_tworep2.aln.sorted.bam,ES_tworep1.aln.sorted.bam,ES_tworep2.aln.sorted.bam,NE_tworep1.aln.sorted.bam,NE_tworep2.aln.sorted.bam,NS_tworep1.aln.sorted.bam,NS_tworep2.aln.sorted.bam,Pca_Ribes_rep1.aln.sorted.bam,Pca_Ribes_rep2.aln.sorted.bam,Pca_Ribes_rep3.aln.sorted.bam,Pca_Salix_rep1.aln.sorted.bam,Pca_Salix_rep2.aln.sorted.bam,Pca_Salix_rep3.aln.sorted.bam,Pca_Udi_rep1.aln.sorted.bam,Pca_Udi_rep2.aln.sorted.bam,Pca_Udi_rep3.aln.sorted.bam,SE_tworep2.aln.sorted.bam,SN_seventeenrep1.aln.sorted.bam,SN_tworep1.aln.sorted.bam,T_14D_rep4.aln.sorted.bam,T_DAE_rep1.aln.sorted.bam,T_EOD_rep2.aln.sorted.bam,T_MOD_rep2.aln.sorted.bam,T_RAD_rep1.aln.sorted.bam

braker.pl --genome=$genome --prot_seq=$proteins --bam=$bamfiles --etpmode --softmasking --cores=40

# error on run
[Thu Sep 17 15:49:26 2020] Enqueueing pair 329050/329379 (99.9%). Est. time left: 00:00:02 (hh:mm:ss)
[Thu Sep 17 15:50:28 2020] 329379/329379 (100%) pairs aligned
[Thu Sep 17 15:50:28 2020] Alignment of pairs finished
[Thu Sep 17 15:50:28 2020] Translating coordinates from local pair level to contig level
[Thu Sep 17 15:50:50 2020] Finished spliced alignment
[Thu Sep 17 15:50:51 2020] Processing the output
[Thu Sep 17 15:52:35 2020] Output processed
[Thu Sep 17 15:52:35 2020] ProtHint finished.
ERROR in file /data/programs/BRAKER2_v2.1.5/scripts/braker.pl at line 9481
Failed to execute: /data/programs/Augustus_v3.3.3/bin/joingenes --genesets=/mnt/griffin/marcel/Pca_genome/braker2_test/braker/augustus.E.gtf,/mnt/griffin/marcel/Pca_genome/braker2_test/braker/augustus.Ppri5.gtf_filtered --priorities=2,1 --output=/mnt/griffin/marcel/Pca_genome/braker2_test/braker/join.gtf 1> /dev/null 2> /mnt/griffin/marcel/Pca_genome/braker2_test/braker/errors/joingenes.err!

# OK, check the error file
more /mnt/griffin/marcel/Pca_genome/braker2_test/braker/errors/joingenes.err
Load warning: Did not expect feature "internal". Known features are "CDS", "UTR", "3'-UTR", "5'-UTR", "exon", "intron", "gene", "transcript", "tss", "tts", "s
tart_codon" and "stop_codon". This feature is going to be ignored.
This warning may affect the result.
Load warning: Did not expect feature "initial". Known features are "CDS", "UTR", "3'-UTR", "5'-UTR", "exon", "intron", "gene", "transcript", "tss", "tts", "st
art_codon" and "stop_codon". This feature is going to be ignored.
This warning may affect the result.
Load warning: Did not expect feature "terminal". Known features are "CDS", "UTR", "3'-UTR", "5'-UTR", "exon", "intron", "gene", "transcript", "tss", "tts", "s
tart_codon" and "stop_codon". This feature is going to be ignored.
This warning may affect the result.
Segmentation fault


# OK, so I am attempting to run this
/data/programs/Augustus_v3.3.3/bin/joingenes --genesets=/mnt/griffin/marcel/Pca_genome/braker2_test/braker/augustus.E.gtf,/mnt/griffin/marcel/Pca_genome/braker2_test/braker/augustus.Ppri5.gtf_filtered --priorities=2,1 --output=/mnt/griffin/marcel/Pca_genome/braker2_test/braker/join.gtf 1> /dev/null 2> /mnt/griffin/marcel/Pca_genome/braker2_test/braker/errors/joingenes.err
# returns
Segmentation fault
