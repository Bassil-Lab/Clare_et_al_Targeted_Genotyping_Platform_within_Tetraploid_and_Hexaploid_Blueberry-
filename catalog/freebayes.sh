###################
#Transcript variant callsing


###################
#rg_deduped_sorted_clean_SRR1187673_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR1187677_2PASS_Aligned.out.bam

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/SNP_VCF_files

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR1187673_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR1187677_2PASS_Aligned.out.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> PRJNA241028.vcf

###################
#rg_deduped_sorted_clean_combined_SRR50361_2PASS_Aligned.out.bam

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/SNP_VCF_files

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_combined_SRR50361_2PASS_Aligned.out.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> PRJNA353989.vcf

###################
#rg_deduped_sorted_clean_combined_SRR536542.bam

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/SNP_VCF_files

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_combined_SRR536542.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> SRR536542.vcf

###################
#rg_deduped_sorted_clean_combined_SRR752aurora_2PASS_Aligned.out.bam

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/SNP_VCF_files

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_combined_SRR752aurora_2PASS_Aligned.out.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> SRR752aurora.vcf


###################
#rg_deduped_sorted_clean_combined_SRR64729arlen_2PASS_Aligned.out.bam

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_combined_SRR64729arlen_2PASS_Aligned.out.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> SRR64729arlen.vcf

###################
#rg_deduped_sorted_clean_SRR8371779_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371782_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371783_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371784_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371809_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371823_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371825_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371790_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371796_2PASS_Aligned.out.bam
#rg_deduped_sorted_clean_SRR8371810_2PASS_Aligned.out.bam

cd /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/SNP_VCF_files

freebayes -f /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
-b /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371779_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371782_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371783_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371784_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371809_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371823_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371825_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371790_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371796_2PASS_Aligned.out.bam \
/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/rg_deduped_sorted_clean_SRR8371810_2PASS_Aligned.out.bam \
--cnv-map /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_166/ploidy_166.bed \
> PRJNA511922.vcf
