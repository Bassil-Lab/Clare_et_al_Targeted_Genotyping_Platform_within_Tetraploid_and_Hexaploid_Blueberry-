
######################################################################################################################################

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_macrocarpon/

fastqfiles=`ls -1 ./*.gz`

for file in ${fastqfiles}; do
    fastqc -t 6 ${file} -o /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/fastqc_files/paired-end/;

done;
