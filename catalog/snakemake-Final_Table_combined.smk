from snakemake.utils import min_version
min_version("6.3.0")

## A simple example snakemake .smk file for parallelising freebayes
## Uses a fasta_generate_regions to split the genome into regions of equal size based on the .fai index
## As snakemake automatically moves each cpu core to the next genome chunk, this works out faster
## than the freebayes-parallel wrapper.
## This .smk file assumes we have a list of the bam files called bam.list
## This .smk file splits the genome by chromosome, which of course, is not necessary.
## One will want to edit the paths (for example, the path to bam files)

configfile: "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/snakemake-Final_Table_combined.yaml"

rule all:
    input:
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/master_table_files/MasterTable_{chroms}.txt", chroms=config["chroms"])

rule RunFinalTableCombined:
    input:
        table1 = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Table1_files/Table1_files_{chroms}.txt",
        table2 = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Table2_files/Table2_file_{chroms}.txt",
        collab = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Collab_priority_trait_citation_data.txt"
    output:
        mastertable = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/master_table_files/MasterTable_{chroms}.txt"
    params:
        chroms = config["chroms"]
    threads:1
    shell:
         """
          /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/Final_Table_combined.py -t1 {input.table1} -t2 {input.table2} -c {input.collab} -o {output.mastertable}
         """
