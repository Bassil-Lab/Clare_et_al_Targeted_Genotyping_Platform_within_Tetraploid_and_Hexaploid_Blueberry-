vcffiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/*SU_files/Vcev1_p0.*/{single,sorted}*.vcf`

for file in ${vcffiles}
do

newname=`echo ${file} | cut -d "/" -f10`

cat ${file} | bcftools view -S /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/include_samples.txt \
| bcftools view -i '%QUAL>=20 && MIN(INFO/AF)>=.10 && MAX(INFO/DP)<=7146' --threads 50 \
| bcftools filter -e '(FORMAT/RO)=1 | (FORMAT/RO)=2 | (FORMAT/RO)=3 | (FORMAT/RO)=4' -S . --threads 50 \
| bcftools filter -e '(FORMAT/AO)=1 | (FORMAT/AO)=2 | (FORMAT/AO)=3 | (FORMAT/AO)=4' -S . --threads 50 \
| bcftools view -i 'F_MISSING<=0.2' --threads 50 \
> /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_VCF_files_.10MAF/filtered_${newname}.vcf

done

