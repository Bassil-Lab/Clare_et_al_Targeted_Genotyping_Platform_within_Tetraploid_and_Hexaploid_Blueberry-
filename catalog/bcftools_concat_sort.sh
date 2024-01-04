#####################
#WSU 
while read line
do

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/WSU_files/${line}

bcftools concat *Vcev1_p0.*.vcf --threads 50 | vcfuniq > ./concat_${line}.vcf

bcftools sort ./concat_${line}.vcf -m 10G --temp-dir ./ --output-file ./sorted_${line}.vcf

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/WSU_files/concat_directories.txt



#####################
#OSU
while read line
do

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/OSU_files/${line}

bcftools concat Vcev1_p0.*.vcf --threads 50 | vcfuniq > ./concat_${line}.vcf

bcftools sort ./concat_${line}.vcf -m 10G --temp-dir ./ --output-file ./sorted_${line}.vcf

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/OSU_files/concat_directories.txt
