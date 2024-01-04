cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic
	
STAR --genomeDir /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic/clean_SRR536542 \
--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/single-end/transcriptomic/clean_combined_SRR536542_1.fastq.gz \
--readFilesCommand zcat \
--runThreadN 50 \
--alignIntronMin 25 \
--alignIntronMax 44760 \
--outFileNamePrefix /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic/clean_SRR536542_2PASS_




##############
#paired-end

#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#infiles=`ls -1 ./*Aligned.out.sam `

#for file in ${infiles}; do
#	newname=`echo ${file} | sed 's/_Aligned.out.sam//g'`;
#	STAR --genomeDir ./${newname} \
#	--readFilesCommand zcat \
#	--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${newname}_1.fastq.gz \
#	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${newname}_2.fastq.gz \
#	--alignIntronMin 25 --alignIntronMax 44760 --outFileNamePrefix /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/${newname}_2PASS_;

#done
	
##############
#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#while read line
#do
#	STAR --genomeDir ${line} \
#	--readFilesCommand zcat \
#	--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${line}_1.fastq.gz \
#	/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/${line}_2.fastq.gz \
#	--alignIntronMin 25 \
#	--alignIntronMax 44760 \
#	--outFileNamePrefix /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/${line}_2PASS_

#done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/allfilenames.txt



##################################
#clean_SRR8371808

#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#STAR --genomeDir ./clean_SRR8371808 \
#--readFilesCommand zcat \
#--readFilesIn /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/clean_SRR8371808_1.fastq.gz \
#/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/paired-end/transcriptomic/clean_SRR8371808_2.fastq.gz \
#--alignIntronMin 25 --alignIntronMax 44760 --outFileNamePrefix /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/clean_SRR8371808_2PASS_




