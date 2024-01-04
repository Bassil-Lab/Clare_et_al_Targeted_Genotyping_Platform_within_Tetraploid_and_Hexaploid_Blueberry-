##################
#Transcript#
vcffiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/filtered_*.vcf`

for file in ${vcffiles}
do

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1`

./extract_flanking_sequences_for_SV.py -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-v ${file} \
-o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/${filename}.fastq

done


##################
#Genomic#
vcffiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_VCF_files_.10MAF/*.vcf`


for file in ${vcffiles}
do 

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1,2`


./extract_flanking_sequences_for_SV.py -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-v ${file} \
-o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fastq_files/${filename}.fastq

done
