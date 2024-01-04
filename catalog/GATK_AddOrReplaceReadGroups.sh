
###################
#Driscolls 2015
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Driscolls/2015

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Driscolls/2015/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Driscolls/2015/read_group_file.txt

###################
#Driscolls 2019
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Driscolls/2019

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Driscolls/2019/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Driscolls/2019/read_group_file.txt


###################
#Pat Edger Vac_macro

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/Vac_marc

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Pat_Edger/Vac_macro/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/Vac_marc/read_group_file.txt

###################
#Susan Thompson

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Susan_Thompson

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Susan_Thompson/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Susan_Thompson/read_group_file.txt

###################
#NCGR 

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCGR

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/NCGR/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCGR/read_group_file.txt

###################
#NCBI

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCBI

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/NCBI/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCBI/read_group_file.txt

####################
#Pat Edger Vac_cory

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger

while read -r read_group bam_file type; do


gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Pat_Edger/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/read_group_file.txt

######################
#Breeding Insight

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Breeding_Insight

while read -r read_group bam_file type; do

gatk AddOrReplaceReadGroups \
-I ${bam_file} \
-O /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/Breeding_Insight/rg_${bam_file} \
--RGID $read_group \
--RGLB VacCap \
--RGPL ${type} \
--RGPU ${read_group} \
--RGSM ${read_group}

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Breeding_Insight/read_group_file.txt
