#######################################################################################################
#VaccDscaff9-augustus-gene-379.23

bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/gene/VaccDscaff9-augustus-gene-379.23.fastq \
-t 50 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/gene/VaccDscaff9-augustus-gene-379.23.bam


#######################################################################################################
#Trasncript data

vcffastqfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/filtered_*.fastq`

for file in ${vcffastqfiles}
do 

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1`

bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
${file} \
-t 50 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/${filename}.bam
#done


#######################################################################################################
#VCF flanking sequences


vcffastqfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fastq_files/filtered_Vcev1_p0.C002.fastq`

for file in ${vcffastqfiles}
do

filename=`echo ${file} |  cut -d "/" -f10 | cut -d "." -f1,2`

bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
${file} \
-t 50 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_bam_files/${filename}.bam

done

#######################################################################################################
#Single-end Transcriptomic SRR files


cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/single-end/transcriptomic

bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/single-end/transcriptomic/clean_combined_SRR536542_1.fastq.gz \
-t 12 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic/sorted_clean_combined_SRR536542.bam


#######################################################################################################
#Paired-SRR files

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/genomic

while read line
do
	bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/genomic/${line}_1.fastq.gz \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/genomic/${line}_1.fastq.gz \
	-t 14 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/genomic/sorted_${line}.bam -

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/genomic/SRR_filenames.txt



#######################################################################################################
#pat paired-end files

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory

while read line
do
	bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory/${line}_1.fastq \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory/${line}_2.fastq \
	 -t 14 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_cory/sorted_${line}.bam -

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory/Vac_cory.txt

##########################

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc

while read line
do
	bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc/${line}_1.fastq \
	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc/${line}_2.fastq \
	-t 14 | samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/pat_edger/Vac_marc/sorted_${line}.bam -

done <  /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc/Vac_marc.txt

#######################################################################################################
#SNPs

fastqfiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/SNP_data/*.fastq`

for file in ${fastqfiles}; do
	
	newfile=`echo ${file} | cut -d "/" -f9 | cut -d "." -f1`

	bwa mem /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
	${file} \
	| samtools sort -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/SNP_bams/sorted_${newfile}.bam -

done;
	


