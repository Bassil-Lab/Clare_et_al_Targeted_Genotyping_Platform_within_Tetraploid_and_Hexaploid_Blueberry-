###############
#Single-ended transcriptomic

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic

gatk MarkDuplicates \
--INPUT ./clean_SRR536542_2PASS_Aligned.out.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCBI/deduped_sorted_clean_combined_SRR536542.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/NCBI/deduped_sorted_clean_combined_SRR536542_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/


###############
#Driscolls 2015

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/Driscoll/2015

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/Driscoll/2015/filenames.txt


###############
#Driscolls 2019

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/Driscoll/2019

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/Driscoll/2019/filenames.txt



###############
#Single-end genomic

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/genomic

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/genomic/filenames.txt


###############
#Paired-end Transcriptomic

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/made/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/filenames.txt



###############
#Pat's Var_marc

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_marc

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/Vac_marc/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/Vac_marc/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/Pat_Edger/Vac_marc/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_marc/filenames.txt


###############
#Pat's Vac_cory

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_cory

while read line
do

gatk MarkDuplicates \
--INPUT ./${line}.bam \
--OUTPUT /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/deduped_${line}.bam \
-M /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/deduped_${line}_metrics.txt \
--REMOVE_DUPLICATES true \
--MAX_RECORDS_IN_RAM 1000000 \
--TMP_DIR /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/deduped_bam_files/

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_cory/filenames.txt


