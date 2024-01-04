
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic

sam_files=`ls -1 ./clean*2PASS_Aligned.out.sam`


for file in ${sam_files}; do

newfile=`echo ${file} | sed 's/.sam/.bam/g' | cut -d "/" -f2`

samtools view -S -b ${file} > ${newfile};

done;
exit




