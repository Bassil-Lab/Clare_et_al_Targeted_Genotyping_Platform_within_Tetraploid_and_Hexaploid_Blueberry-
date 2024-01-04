
#######################
#Transcript and De Novo Code

blastfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_blast_files/blast_bwa_filtered_*.txt`


for file in ${blastfiles}
do

filename=`echo ${file} | | cut -d "/" -f10 | cut -d "_" -f4,5 | cut -d "." -f1,2`

./FilterVCFwithBLASTn.py \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_blast_files/blast_bwa_filtered_${filename}.txt \
-f /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fastq_files/filtered_${filename}.fastq \
-v /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_VCF_files_.10MAF/filtered_${filename}.vcf \
-k /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_single_mapping_VCF_files/single_mapping_Chrom_pos_${filename}.txt \
-fv /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_single_mapping_VCF_files//filtered_single_mapping_${filename}.vcf

done



