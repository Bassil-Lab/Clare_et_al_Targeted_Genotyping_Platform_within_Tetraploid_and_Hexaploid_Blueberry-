cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic

infiles=`ls -1 ./*Aligned.out.sam`

for file in ${infiles}; do
	newname=`echo ${file} | sed 's/_Aligned.out.sam//g' | cut -d "/" -f2`;

        mkdir ./clean_${newname}

	STAR --runMode genomeGenerate --runThreadN 50 --genomeDir ./clean_${newname} \
	--genomeFastaFiles /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
	--sjdbGTFfile /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/Vac1.genes.ToNahla-HMD_samenames.gtf \
	--sjdbOverhang 100 \
        --genomeSAindexNbases 13 \
	--sjdbFileChrStartEnd ${newname}_SJ.in.tab;
done

##########
#paired-end Transcriptomic

#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#infiles=`ls -1 ./*Aligned.out.sam `

#for file in ${infiles}; do
#	newname=`echo ${file} | sed 's/_Aligned.out.sam//g'`;
#
#	mkdir ${newname};
#
#	STAR --runMode genomeGenerate --runThreadN 14 --genomeDir ${newname} \
#	--genomeFastaFiles /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
#	--sjdbGTFfile /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/Vac1.genes.ToNahla-HMD_samenames.gtf \
#	--sjdbOverhang 100 \
#	--sjdbFileChrStartEnd ${newname}_SJ.in.tab;
#done



#########################################
#worked
#clean_SRR8371808


#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#mkdir  clean_SRR8371805

#STAR --runMode genomeGenerate \
#--runThreadN 14 \
#--genomeDir clean_SRR8371808 \
#--genomeSAindexNbases 13 \
#--genomeFastaFiles /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
#--sjdbGTFfile /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/Vac1.genes.ToNahla-HMD_samenames.gtf \
#--sjdbOverhang 100 \
#--sjdbFileChrStartEnd ./clean_SRR8371808_SJ.in.tab

#########################################
#rest

#cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic

#while read line
#do

#mkdir ${line}

#STAR --runMode genomeGenerate \
#--runThreadN 14 \
#--genomeDir ./${line} \
#--genomeSAindexNbases 13 \
#--genomeFastaFiles /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
#--sjdbGTFfile /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/Vac1.genes.ToNahla-HMD_samenames.gtf \
#--sjdbOverhang 100 \
#--sjdbFileChrStartEnd ./${line}_SJ.in.tab

#done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/paired-end/transcriptomic/allfilenames.txt

#############
