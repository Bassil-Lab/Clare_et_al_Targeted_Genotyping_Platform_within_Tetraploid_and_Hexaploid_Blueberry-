#mkdir /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0_P0_STAR

STAR --runMode genomeGenerate \
--runThreadN 14 \
--genomeDir /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0_P0_STAR \
--genomeFastaFiles /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/P0_reference/Vce1.0.singleline.p0.fasta \
--sjdbOverhang 100 \
--sjdbGTFfile /nfs3/HORT/Bassil_Lab/mandie/reference_genomes/Blueberry_genomes/Vac1.genes.ToNahla-HMD_samenames.gtf  \
--genomeSAindexNbases 13

