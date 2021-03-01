
################################

# plotting
https://busco.ezlab.org/busco_userguide.html#companion-scripts

genome=Pcalbum_chromosome_and_unplaced.fa
library=lepidoptera_odb10
outfile=Pcalbum_chromosome_and_unplaced_v_lep_odb10

# parameters
export BUSCO_CONFIG_FILE=/data/programs/busco-4.1.2/config/config.ini
python3 /data/programs/busco-4.1.2/bin/busco -i $genome -l $library -m genome -o $outfile -c 30
# then assess
head -30 Pcalbum_chromosome_and_unplaced_v_lep_odb10/short_summary.specific.lepidoptera_odb10.Pcalbum_chromosome_and_unplaced_v_lep_odb10.txt
# BUSCO version is: 5.beta
# The lineage dataset is: lepidoptera_odb10 (Creation date: 2020-08-05, number of species: 16, number of BUSCOs: 5286)
# Summarized benchmarking in BUSCO notation for file /mnt/griffin/Polygonia_genome/genomes/Pc_album.mpss.cln.msk.haploidA.fa
# BUSCO was run in mode: genome


--------------------------------------------------
        |Results from dataset lepidoptera_odb10           |
        --------------------------------------------------
        |C:90.4%[S:90.1%,D:0.3%],F:4.7%,M:4.9%,n:5286     |
        |4780   Complete BUSCOs (C)                       |
        |4763   Complete and single-copy BUSCOs (S)       |
        |17     Complete and duplicated BUSCOs (D)        |
        |247    Fragmented BUSCOs (F)                     |
        |259    Missing BUSCOs (M)                        |
        |5286   Total BUSCO groups searched               |
        --------------------------------------------------
INFO:   BUSCO analysis done. Total running time: 622 seconds
