###########################################################################################################################$
#single-end

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/Driscolls/2019

fastqfiles=`ls -1 ./*.gz`

for file in ${fastqfiles}; do 
	fastqc ${file} -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/fastqc_files/single-end/;

done;


