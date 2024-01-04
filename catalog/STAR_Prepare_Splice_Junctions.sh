cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/bam_files/single-end/transcriptomic/


infiles=`ls -1 ./*SJ.out.tab`

for file in ${infiles}; do
	newfilename=`echo ${file} | cut -d "/" -f2 | cut -d "." -f1`; 

	awk 'BEGIN {OFS="\t"; strChar[0]="."; strChar[1]="+"; strChar[2]="-";} {if($5>0){print $1,$2,$3,strChar[$4]}}' ${file} > ${newfilename}.in.tab;
done
