
# previous work scripts from Wheat
export PATH=/data/programs/augustus-3.3.1/bin/:/data/programs/BRAKER.v.2.1.1/scripts/:$PATH
export GENEMARK_PATH=/data/programs/gm_et_linux_64/gmes_petap
export AUGUSTUS_CONFIG_PATH=/data/programs/Augustus-3.3.1/config
export AUGUSTUS_SCRIPTS_PATH=/data/programs/Augustus-3.3.1/scripts
export BAMTOOLS_PATH=/data/programs/bamtools-2.5.1/bin/
export BLAST_PATH=/data/programs/ncbi-blast-2.2.31+/bin
export SAMTOOLS_PATH=/data/programs/samtools-1.7/
# setting the alignment tool
export ALIGNMENT_TOOL_PATH=/data/programs/gth-1.7.0-Linux_x86_64-64bit/bin
# input
# input
proteins=/mnt/griffin/chrwhe/Paeg_assembly/annotation/Bicyclus_anynana_nBa.0.1_-_proteins.90ed.fa
genome=/mnt/griffin/chrwhe/Paeg_assembly/Pararge_aegeria_v2/final/Paeg.pol2.cln.msk.hapA.tndrm.mespaSS.fa

# get list of bam files
bamfiles=Pae1C03Aligned.out.bam,Pae1C06Aligned.out.bam,Pae1C12Aligned.out.bam,Pae1E03Aligned.out.bam,Pae1E06Aligned.out.bam,Pae1E12Aligned.out.bam,Pae1E24Aligned.out.bam,Pae1M03Aligned.out.bam,Pae1M06Aligned.out.bam,Pae1M12Aligned.out.bam,Pae1M24Aligned.out.bam,Pae2C03Aligned.out.bam,Pae2C06Aligned.out.bam,Pae2C22Aligned.out.bam,Pae2C24Aligned.out.bam,Pae2E03Aligned.out.bam,Pae2E06Aligned.out.bam,Pae2E22Aligned.out.bam,Pae2E24Aligned.out.bam,Pae2M03Aligned.out.bam,Pae2M06Aligned.out.bam,Pae2M22Aligned.out.bam,Pae2M24Aligned.out.bam,Pae3E03Aligned.out.bam,Pae3E06Aligned.out.bam,Pae3E24Aligned.out.bam,Pae3E32Aligned.out.bam,Pae3M03Aligned.out.bam,Pae3M06Aligned.out.bam,Pae3M24Aligned.out.bam,Pae3M32Aligned.out.bam
# using "--prot_seq" since I have not run the gth alignment
braker.pl --species=P_aegeria_v2_RNAseq_prot --genome=$genome --bam=$bamfiles --prot_seq=$proteins --prg=gth --cores 32


########
# files needed
#
# genome
# soft masked version

# RNAseq datasets for mapping

# protein set of training

# need to decide upon mapping settings
# need to decide upon the braker settings for the annotation.
