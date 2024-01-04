#########################
#transcript

bamfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/filtered_*.bam`


for file in ${bamfiles}
do

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1`

./filt_bams_for_blast.py -b ${file} \
-f /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/${filename}.fastq \
-o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/bwa_${filename}.fasta

done

#########################
#do novo

bamfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_bam_files/filtered_Vcev1_p0.S*.bam`

for file in ${bamfiles}
do

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1,2`

./filt_bams_for_blast.py -b ${file} \
-f /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fastq_files/${filename}.fastq \
-o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fasta_files/bwa_${filename}.fasta

done
