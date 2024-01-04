from snakemake.utils import min_version
min_version("6.3.0")

## A simple example snakemake .smk file for parallelising freebayes
## Uses a fasta_generate_regions to split the genome into regions of equal size based on the .fai index
## As snakemake automatically moves each cpu core to the next genome chunk, this works out faster
## than the freebayes-parallel wrapper.
## This .smk file assumes we have a list of the bam files called bam.list
## This .smk file splits the genome by chromosome, which of course, is not necessary.
## One will want to edit the paths (for example, the path to bam files)

configfile: "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/freebayes_config_VacCAP_GenerateFreebayesRegions_OSU.yaml"

rule all:
    input:
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{chroms}/300split.{chroms}.region.{i}.bed", chroms=config["chroms"], i=list(range(1,config["chunks"]+1))),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{rest}/1split.{rest}.region.{m}.bed", rest=config["rest"], m=list(range(1,config["nosplit"]+1)))

rule GenerateFreebayesRegionsChroms:
    input:
        ref=config["reference"]
    output: 
       	"/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{chroms}/300split.{chroms}.region.{i}.bed"
    params:
        chroms="{chroms}",
        i="{i}",
        chunks=config["chunks"]
    shell:
        """
        /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/fasta_generate_regions.py \
        {input.ref} \
        {params.chunks} \
        --chunks \
        --bed /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{params.chroms}/300split --chromosome {params.chroms}
        """

rule GenerateFreebayesRegionsRest:
    input:
        ref=config["reference"]
    output:
        "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{rest}/1split.{rest}.region.{m}.bed"
    params:
        rest="{rest}",
        m="{m}",
        nosplit=config["nosplit"]
    shell:
        """
        /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/fasta_generate_regions.py \
        {input.ref} \
        {params.nosplit} \
        --chunks \
        --bed /nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/region_files/{params.rest}/1split --chromosome {params.rest}
        """
