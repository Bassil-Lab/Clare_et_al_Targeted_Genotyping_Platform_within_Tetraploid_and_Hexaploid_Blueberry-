from snakemake.utils import min_version
min_version("6.3.0")

## A simple example snakemake .smk file for parallelising freebayes
## Uses a fasta_generate_regions to split the genome into regions of equal size based on the .fai index
## As snakemake automatically moves each cpu core to the next genome chunk, this works out faster
## than the freebayes-parallel wrapper.
## This .smk file assumes we have a list of the bam files called bam.list
## This .smk file splits the genome by chromosome, which of course, is not necessary.
## One will want to edit the paths (for example, the path to bam files)

configfile: "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/snakemake-Final_Table_denovo.yaml"

rule all:
    input:
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Table2_files/Table2_file_{chroms}.txt", chroms=config["chroms"])

rule RunFinalTableShared:
    input:
        hardcore = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/W85_Hard_Core_P0_4BB.txt",
        softcore = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/W85_Soft_Core_P0_4BB.txt",
        gfffile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/vcae1.4.gff3",
        singlefile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/filtered_single_mapping_VCF_files/single_mapping_Chrom_pos_{chroms}.txt",
        table1 = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Table1_files/Table1_files_{chroms}.txt"
    output:
        table2 = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/Table2_files/Table2_file_{chroms}.txt"
    params:
        chroms = config["chroms"]
    threads:1
    shell:
         """
          /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/Final_Table_denovo.py -hc {input.hardcore} -sc {input.softcore} -g {input.gfffile} -f {input.singlefile} -t {input.table1} -o {output.table2}
         """
