
while read -r chrom start stop
do

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/${chrom}/

samtools view -b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/sorted_VacCAP_50.bam --threads 50 ${chrom}:${start}-${stop} > sorted_VacCAP_50_${chrom}.${start}.${stop}.bam

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/all_regions_OSU.txt
