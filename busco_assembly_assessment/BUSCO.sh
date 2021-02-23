
################################

# plotting
https://busco.ezlab.org/busco_userguide.html#companion-scripts

# note that you can generate some simple plots that might be nice for comparing among different assemblies
# during the process of polishing, etc.


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
