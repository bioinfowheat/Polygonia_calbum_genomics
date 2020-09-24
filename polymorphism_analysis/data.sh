#
P6403_102	YES	Polygonia_c-album.SWE.13-15.Stockholm.HA_FIeld.Thorax.36_1.fastq.gz	Polygonia	c-album	SWE	13-15	Stockholm	HA_FIeld	Thorax	36	1	fastq.gz					SciLife	robot	D448, freeezer no. 2, drawer 2.7	HISEQX	670	150	P6403	2016-10-20						503
P6403_102	YES	Polygonia_c-album.SWE.13-15.Stockholm.HA_Field.Thorax.36_2.fastq.gz	Polygonia	c-album	SWE	13-15	Stockholm	HA_Field	Thorax	36	2	fastq.gz					SciLife	robot	D448, freeezer no. 2, drawer 2.7	HISEQX	670	150	P6403	2016-10-20						504



P6403_102

# login
ssh chrisbak@ren.lan.zoologi.su.se


# find data
cd /share/chrisbak
# ls Colias_crocea*Alba* | wc -l # 24 reads, 12 samples.
# /share/chrisbak/reads5/clean $ ls Colias_crocea*Field*Alba* | wc -l
# 18
find . -name "*Polygonia*" # nothing
./reads6/compressed/Polygonia_c-album.SWE.13-15.Stockholm.HA_Field.Thorax.36_2.fastq.gz
./reads6/compressed/Polygonia_c-album.SWE.13-15.Stockholm.HA_FIeld.Thorax.36_1.fastq.gz

cd /mnt/griffin/chrwhe/Polygonia_calbum
mkdir Polygonia_calbum_poolseq_data
cd Polygonia_calbum_poolseq_data
# transfer
scp chrisbak@ren.lan.zoologi.su.se:/share/chrisbak/reads6/compressed/Polygonia_c-album.SWE.13-15.Stockholm.HA_FIeld.Thorax.36_1.fastq.gz .
scp chrisbak@ren.lan.zoologi.su.se:/share/chrisbak/reads6/compressed/Polygonia_c-album.SWE.13-15.Stockholm.HA_Field.Thorax.36_2.fastq.gz .

sudo mv /mnt/griffin/chrwhe/Polygonia_calbum/Polygonia_calbum_poolseq_data /mnt/griffin/Reads/
sudo chown -R :general /mnt/griffin/Reads/
