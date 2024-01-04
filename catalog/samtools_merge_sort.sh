cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/

samtools merge -b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/VacCAP_50_bamfiles.txt \
VacCAP_50.bam \
--threads 50 \

samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/sorted_VacCAP_50.bam \
VacCAP_50.bam \
-m 10G \
--threads 50


