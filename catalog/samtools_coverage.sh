cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/

while read line
do 

samtools coverage --bam-list /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/VacCAP_50_bamfiles.txt -r ${line} \
>> /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/P0_coverage.txt

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/P0chromosomes.txt

