
#Example of removing plasmid/chloroplast DNA with literal and other quality filtering on single-end
/nfs3/HORT/Bassil_Lab/mandie/bbmap/bbduk.sh \
in1=Jewel_all_1094.fq \
out1=filt_Jewel_all_1094.fq \
literal=CTGCGTTCGGGAAGGATGAATCGCTCCCGAAAAGGAATCTACTGATTCTCTGCTAATTGGTTGG,\
CAGCGAATCGAACAAAAAAAAGTCATCAAAAAAATGACTGAGATAATCGAGTTAATATATATCG \
ktrim=r k=21 mink=11 hdist=2 tpe tbo maq=25 minlen=25

#Example of removing adapter contamination with reference files and other quality filtering on pair-end
/nfs3/HORT/Bassil_Lab/mandie/bbmap/bbduk.sh \
in1=combined_SRR11517_1.fastq \
in2=combined_SRR11517_2.fastq \
out1=clean_combined_SRR11517_1.fastq \
out2=clean_combined_SRR11517_2.fastq \
ref=/nfs3/HORT/Bassil_Lab/mandie/bbmap/resources/adapters.fa.gz,/nfs3/HORT/Bassil_Lab/mandie/bbmap/resources/fastqc_adapters.fa.gz \
ktrim=r k=21 mink=11 hdist=2 tpe tbo maq=25 minlen=25



#Example of removing poly sequences due to sequencer chemistry and other quality filtering on paired-end in a loop
cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_corymbosum

while read line
do
	/nfs3/HORT/Bassil_Lab/mandie/bbmap/bbduk.sh \
	in1=./${line}_1.fastq \
	in2=./${line}_2.fastq \
	out1=/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory/clean_${line}_1.fastq \
	out2=/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_cory/clean_${line}_2.fastq \
	ref=/nfs3/HORT/Bassil_Lab/mandie/bbmap/resources/poly.fa.gz \
	t=12 \
	ktrim=r k=21 mink=11 hdist=2 tpe tbo maq=25 minlen=25 
done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_corymbosum/Vac_cory.txt



cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_macrocarpon

while read line
do
        /nfs3/HORT/Bassil_Lab/mandie/bbmap/bbduk.sh \
        in1=./${line}_1.fastq \
        in2=./${line}_2.fastq \
        out1=/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc/clean_${line}_1.fastq \
        out2=/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/clean_fastq_files/pat_edger/Vac_marc/clean_${line}_2.fastq \
        ref=/nfs3/HORT/Bassil_Lab/mandie/bbmap/resources/poly.fa.gz \
        t=13 \
        ktrim=r k=21 mink=11 hdist=2 tpe tbo maq=25 minlen=25

done < /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/collaborator_files/Pat_Edger_NCBI_files/Vac_macrocarpon/Vac_marc.txt


