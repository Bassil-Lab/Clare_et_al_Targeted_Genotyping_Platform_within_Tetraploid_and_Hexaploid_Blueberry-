###################
#transcript

fastafiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/bwa_*.fasta`

for file in ${fastafiles}
do

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1`

blastn -db /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-query ${file} \
-num_threads 50 \
-outfmt "6 qseqid sseqid qstart qend sstart send evalue pident length qseq sseq" \
-out /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/transcript_VCF_files/blast_${filename}.txt

done

###################
#de novo
fastafiles=`ls -1 /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_fasta_files/bwa_filtered_Vcev1_p0.*.fasta`

for file in ${fastafiles}
do

filename=`echo ${file} | cut -d "/" -f10 | cut -d "." -f1,2`

blastn -db /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-query ${file} \
-num_threads 50 \
-outfmt "6 qseqid sseqid qstart qend sstart send evalue pident length qseq sseq" \
-out /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcf_blast_files/blast_${filename}.txt

done

