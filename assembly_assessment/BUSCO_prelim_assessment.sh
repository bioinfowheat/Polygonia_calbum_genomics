# on MILES

################################

24 August 2020 working examples

# standard run with insect SCO genes

genome=PmacD_assembly.fasta
library=insecta_odb10
outfile=PmacD_assembly_v_insecta_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

################################
# depending upon the species, you should also run with Lep specific buscos

genome=PmacD_assembly.fasta
library=lepidoptera_odb10
outfile=PmacD_assembly_v_lepidoptera_odb10
# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30


# plotting
https://busco.ezlab.org/busco_userguide.html#companion-scripts

# note that you can generate some simple plots that might be nice for comparing among different assemblies
# during the process of polishing, etc.


# results from short_summar*
# insecta_odb9
# BUSCO version is: 5.beta
# The lineage dataset is: insecta_odb10 (Creation date: 2020-08-05, number of species: 75, number of BUSCOs: 1367)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Pieris_macdunnoughii/busco/PmacD_assembly.fasta
# BUSCO was run in mode: genome

        ***** Results: *****

        C:92.4%[S:76.3%,D:16.1%],F:4.6%,M:3.0%,n:1367
        1263    Complete BUSCOs (C)
        1043    Complete and single-copy BUSCOs (S)
        220     Complete and duplicated BUSCOs (D)
        63      Fragmented BUSCOs (F)
        41      Missing BUSCOs (M)
        1367    Total BUSCO groups searched

# lep_obd10
# BUSCO version is: 5.beta
# The lineage dataset is: lepidoptera_odb10 (Creation date: 2020-08-05, number of species: 16, number of BUSCOs: 5286)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Pieris_macdunnoughii/busco/PmacD_assembly.fasta
# BUSCO was run in mode: genome

        ***** Results: *****

        C:90.4%[S:75.1%,D:15.3%],F:5.6%,M:4.0%,n:5286
        4778    Complete BUSCOs (C)
        3969    Complete and single-copy BUSCOs (S)
        809     Complete and duplicated BUSCOs (D)
        295     Fragmented BUSCOs (F)
        213     Missing BUSCOs (M)
        5286    Total BUSCO groups searched

##############

# doing this now for the chromosomal level assembly for Polygonia

cd /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/busco

genome=Pcalbum_chromosome.fa
library=insecta_odb10
outfile=Pcalbum_chromosome_v_insecta_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

more short_summary.specific.insecta_odb10.Pcalbum_chromosome_v_insecta_odb10.txt
# BUSCO version is: 5.beta
# The lineage dataset is: insecta_odb10 (Creation date: 2020-08-05, number of species: 75, number of BUSCOs: 1367)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Polygonia_calbum/chromosome_level/busco/Pcalbum_chromoso
me.fa
# BUSCO was run in mode: genome

        ***** Results: *****

        C:80.8%[S:80.7%,D:0.1%],F:3.9%,M:15.3%,n:1367
        1105    Complete BUSCOs (C)
        1103    Complete and single-copy BUSCOs (S)
        2       Complete and duplicated BUSCOs (D)
        53      Fragmented BUSCOs (F)
        209     Missing BUSCOs (M)
        1367    Total BUSCO groups searched

cd /mnt/griffin/chrwhe/Polygonia_calbum/polishing/ngm_full_polish/busco

genome=pilon.fasta
library=insecta_odb10
outfile=NGMpolish_v_insecta_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

more NGMpolish_v_insecta_odb10/short_summary.specific.insecta_odb10.NGMpolish_v_insecta_odb10.txt
# BUSCO version is: 5.beta
# The lineage dataset is: insecta_odb10 (Creation date: 2020-08-05, number of species: 75, number of BUSCOs: 1367)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Polygonia_calbum/polishing/ngm_full_polish/busco/pilon.f
asta
# BUSCO was run in mode: genome

        ***** Results: *****

        C:88.7%[S:88.6%,D:0.1%],F:4.8%,M:6.5%,n:1367
        1213    Complete BUSCOs (C)
        1211    Complete and single-copy BUSCOs (S)
        2       Complete and duplicated BUSCOs (D)
        66      Fragmented BUSCOs (F)
        88      Missing BUSCOs (M)
        1367    Total BUSCO groups searched


genome=pilon.fasta
library=lepidoptera_odb10
outfile=NGMpolish_v_lep_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30

more NGMpolish_v_lep_odb10/short_summary.*
# BUSCO version is: 5.beta
# The lineage dataset is: lepidoptera_odb10 (Creation date: 2020-08-05, number of species: 16, number of BUSCOs: 5286)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/chrwhe/Polygonia_calbum/polishing/ngm_full_polish/busco/pilon.f
asta
# BUSCO was run in mode: genome

        ***** Results: *****

        C:90.8%[S:90.5%,D:0.3%],F:4.5%,M:4.7%,n:5286
        4799    Complete BUSCOs (C)
        4783    Complete and single-copy BUSCOs (S)
        16      Complete and duplicated BUSCOs (D)
        238     Fragmented BUSCOs (F)
        249     Missing BUSCOs (M)
        5286    Total BUSCO groups searched
