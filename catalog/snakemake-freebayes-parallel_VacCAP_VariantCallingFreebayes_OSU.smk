from snakemake.utils import min_version
min_version("6.3.0")

## A simple example snakemake .smk file for parallelising freebayes
## Uses a fasta_generate_regions to split the genome into regions of equal size based on the .fai index
## As snakemake automatically moves each cpu core to the next genome chunk, this works out faster
## than the freebayes-parallel wrapper.
## This .smk file assumes we have a list of the bam files called bam.list
## This .smk file splits the genome by chromosome, which of course, is not necessary.
## One will want to edit the paths (for example, the path to bam files)

configfile: "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/scripts/freebayes_config_VacCAP_VariantCallingFreebayes_OSU.yaml"

rule all:
    input:
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr06/Vcev1_p0.Chr06.{chr06start}.{chr06stop}.vcf", zip, chr06start=config["start06"], chr06stop=config["stop06"]),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr03/Vcev1_p0.Chr03.{chr03start}.{chr03stop}.vcf", zip, chr03start=config["start03"], chr03stop=config["stop03"]),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr11/Vcev1_p0.Chr11.{chr11start}.{chr11stop}.vcf", zip, chr11start=config["start11"], chr11stop=config["stop11"]),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr07/Vcev1_p0.Chr07.{chr07start}.{chr07stop}.vcf", zip, chr07start=config["start07"], chr07stop=config["stop07"]),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr12/Vcev1_p0.Chr12.{chr12start}.{chr12stop}.vcf", zip, chr12start=config["start12"], chr12stop=config["stop12"]),
        expand("/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/{chrrest}/single_{chrrest}.{reststart}.{reststop}.vcf", zip, chrrest=config["rest"], reststart=config["startrest"], reststop=config["stoprest"])

rule CHROM06VariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/Vcev1_p0.Chr06/sorted_VacCAP_50_Vcev1_p0.Chr06.{chr06start}.{chr06stop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/Vcev1_p0.Chr06/region_Vcev1_p0.Chr06.{chr06start}.{chr06stop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr06/Vcev1_p0.Chr06.{chr06start}.{chr06stop}.vcf"
    params:
        chr06start = "{chr06start}",
        chr06stop = "{chr06stop}"
    threads:1
    shell:
        """ 
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """

rule CHROM03VariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/Vcev1_p0.Chr03/sorted_VacCAP_50_Vcev1_p0.Chr03.{chr03start}.{chr03stop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/Vcev1_p0.Chr03/region_Vcev1_p0.Chr03.{chr03start}.{chr03stop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr03/Vcev1_p0.Chr03.{chr03start}.{chr03stop}.vcf"
    params:
        chr03start = "{chr03start}",
       	chr03stop = "{chr03stop}"
    threads:1
    shell:
        """ 
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """

rule CHROM11VariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/Vcev1_p0.Chr11/sorted_VacCAP_50_Vcev1_p0.Chr11.{chr11start}.{chr11stop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/Vcev1_p0.Chr11/region_Vcev1_p0.Chr11.{chr11start}.{chr11stop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr11/Vcev1_p0.Chr11.{chr11start}.{chr11stop}.vcf"
    params:
        chr11start = "{chr11start}",
        chr11stop = "{chr11stop}"
    threads:1
    shell:
        """
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """

rule CHROM07VariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/Vcev1_p0.Chr07/sorted_VacCAP_50_Vcev1_p0.Chr07.{chr07start}.{chr07stop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/Vcev1_p0.Chr07/region_Vcev1_p0.Chr07.{chr07start}.{chr07stop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr07/Vcev1_p0.Chr07.{chr07start}.{chr07stop}.vcf"
    params:
        chr07start = "{chr07start}",
        chr07stop = "{chr07stop}"
    threads:1
    shell:
        """ 
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """

rule CHROM12VariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/Vcev1_p0.Chr12/sorted_VacCAP_50_Vcev1_p0.Chr12.{chr12start}.{chr12stop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/Vcev1_p0.Chr12/region_Vcev1_p0.Chr12.{chr12start}.{chr12stop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/Vcev1_p0.Chr12/Vcev1_p0.Chr12.{chr12start}.{chr12stop}.vcf"
    params:
        chr12start = "{chr12start}",
        chr12stop = "{chr12stop}"
    threads:1
    shell:
        """
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """

rule CHROMRESTVariantCallingFreebayes:
    input:
        ref = config["reference"],
        bam = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/read_group_bam_files/bamfiles_50_regions/{chrrest}/sorted_VacCAP_50_{chrrest}.{reststart}.{reststop}.bam",
        ploidy = config["ploidylist"],
        region = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/freebayes_region_files/{chrrest}/region_{chrrest}.{reststart}.{reststop}.bed"
    output:
        outfile = "/nfs3/HORT/Bassil_Lab/mandie/Blueberry_VacCap_Project/VCF_files/VacCAP/VCF_files/{chrrest}/single_{chrrest}.{reststart}.{reststop}.vcf"
    params:
        chrrest = config["rest"],
        reststarts = config["startrest"],
        reststop = config["stoprest"]
    threads:1
    shell:
        """
        freebayes -f {input.ref} -t {input.region} -b {input.bam} --cnv-map {input.ploidy} --use-best-n-alleles 3 > {output.outfile}
        """
