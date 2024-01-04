###############
#single-end transcriptomic

while read line
do

STAR --genomeDir /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0_P0_STAR/ \
--readFilesCommand zcat \
--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/single-end/transcriptomic/${line}_1.fastq.gz \
--runThreadN 50 --alignIntronMin 25 --alignIntronMax 44760 \
--outFileNamePrefix  /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic/${line}_

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/SRR_filenames.txt


###############
#paired-end transcriptomic

while read line
do

STAR --genomeDir /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0_P0_STAR/ \
--readFilesCommand zcat \
--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${line}_1.fastq.gz \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${line}_2.fastq.gz \
--alignIntronMin 25 --alignIntronMax 44760 --outFileNamePrefix /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/${line}_

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/SRR_filenames.txt




