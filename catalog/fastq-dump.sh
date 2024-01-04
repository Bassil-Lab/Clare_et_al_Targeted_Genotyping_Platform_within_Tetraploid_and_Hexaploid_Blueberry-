#Fetching NCBI files from a text file
while read line 
do
	fastq-dump --split-files ${line}
done <  NCBI_SRA_numbers.txt

#Fetching Pat's Blueberry files
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_corymbosum/

while read line
do
	fastq-dump --split-files ${line}
done <  Vac_corymbosum_NCBI.txt

#Fetching Pat's Cranberry files
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_macrocarpon

while read line
do
  	fastq-dump --split-files ${line}
done <  Vac_macrocarpon_NCBI.txt


#Re-downloading incomplete files
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_macrocarpon

SRAfiles=`ls -1 ./SRR*`

for file in ${SRAfiles}; do
	/local/cluster/sratoolkit/bin/fastq-dump-orig.2.10.9 --split-files ${file}

done;