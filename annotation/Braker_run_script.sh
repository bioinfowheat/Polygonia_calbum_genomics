#annotation with only protein dataset

genome=softmasked.fa
proteins=odb10_arthropoda_proteins.fa

###########
# now set up the other dependencies.

# install a local "key" for running the gmes Gene Mark software in your local home folder
# get the key
cp /data/programs/scripts/gm_key_64 gm_key
# put it in your home folder using this script
cp gm_key ~/.gm_key


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

braker.pl --genome=$genome --prot_seq=$proteins --softmasking --cores=30

# annotation using protein and bam files from RNAseq
# ls *bam | sed 's/.bam/.bam,/g' | tr "\n" " "| sed 's/ //g' > bam_files.csv


ln -s /Pca_genome/annotation/RNA-seq/*fastq.gz .
ln -s /assemblies/Pca_genome.fasta .


# Align RNA seq
# index the genome

hisat2=/data/programs/hisat2-master/

$hisat2/hisat2-build $reference ${genome%.fasta}_Hi2index

for sample in `ls ./*_1.fastq.gz `
do base=$(basename $sample "_1.fastq.gz")
$hisat2/hisat2 -p 40 -x ${reference%.fasta}_Hi2index -S ${base}.sam -q -1 ${base}_1.fastq.gz -2 ${base}_2.fastq.gz
done


# convert to bams and filter out unmapped reads
for i in *sam
do samtools view -bS -F 4 $i > ${i%.sam}.aln.bam
done

for i in *aln.bam
do sambamba sort -t 32 $i
done

#softmask genome using RED

bash redmask.sh Pca_genome.fasta Pca_genome.softmasked

# Run braker2
ls *aln.sorted.bam > bams
genome=Pca_genome.softmasked.fa
bamfiles=$(tr '\n' ',' < bams)
proteins=odb10_arthropoda_proteins.fa
species=Pca
export PATH=/data/programs/augustus-3.3.1/bin/:/cerberus/projects/kaltun/software/BRAKER/scripts/:/cerberus/projects/kaltun/software/BRAKER/:$PATH
export GENEMARK_PATH=/data/programs/gm_et_linux_64/gmes_petap
export AUGUSTUS_CONFIG_PATH=/data/programs/Augustus-3.3.1/config
export AUGUSTUS_SCRIPTS_PATH=/data/programs/Augustus-3.3.1/scripts
export BAMTOOLS_PATH=/data/programs/bamtools-2.5.1/bin/
export BLAST_PATH=/data/programs/ncbi-blast-2.5.0+/bin
export SAMTOOLS_PATH=/data/programs/samtools-1.10/
# setting the alignment tool
export ALIGNMENT_TOOL_PATH=/data/programs/gth-1.7.0-Linux_x86_64-64bit/bin
# input
# input
braker.pl --species=$species --genome=$genome \
--bam=bamfiles --prot_seq=$proteins \
--prg=gth --gth2traingenes --cores 40 \
--softmasking

