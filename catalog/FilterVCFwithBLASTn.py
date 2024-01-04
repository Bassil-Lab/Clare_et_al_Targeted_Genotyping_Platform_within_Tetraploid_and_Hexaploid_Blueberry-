#!/usr/bin/env python

import re
import argparse
from collections import defaultdict

def get_arguments():
    parser = argparse.ArgumentParser(description="Will add discription later")
    parser.add_argument("-b","--blast",help="-f [path/file], Requires a string that contains the path and BLASTn file name.")
    parser.add_argument("-f","--fastq",help="-f [path/file], Requires a string that contains the path and fastq file name.")
    parser.add_argument("-v","--vcf",help="-f [path/file], Requires a string that contains the path and vcf file name.")
    parser.add_argument("-k","--keep_file",help="-f [path/file], Requires a string that contains the path and filtered file name.")
    parser.add_argument("-fv","--filtered_vcf",help="-f [path/file], Requires a string that contains the path and filtered vcf file name.")
    return parser.parse_args()
    
args = get_arguments()
blast = args.blast
fastq = args.fastq
vcf = args.vcf
keep_file = args.keep_file
filtered_vcf = args.filtered_vcf

blastin = open(blast, "r")
fastqin = open(fastq, "r")
vcfin = open(vcf, "r")

keepout = open(keep_file, "w")
vcfout = open(filtered_vcf, "w")

fqdict = defaultdict(list)
blastdict = defaultdict(list)
keeplist = []
collablist = []

        

for fqline in fastqin:
    fqline = fqline.strip()
    if fqline.startswith("@Vcev1"):
        fqline = fqline.replace("@","")
        fqline_parts = fqline.split("_")
        fqname = fqline_parts[0]+"_"+fqline_parts[1]+"_"+fqline_parts[2]
        fqdict[fqname].append(fqline)

for bline in blastin:
    bline = bline.strip()
    bline_parts = bline.split("\t")
    
    SVname = bline_parts[0]
    SVname_parts = SVname.split("_")
    SVnamecut = SVname_parts[0]+"_"+SVname_parts[1]+"_"+SVname_parts[2]

    evalue = bline_parts[6]
    ident = float(bline_parts[7]) 
    algnlen = int(bline_parts[8])
    
    subevalue = float(re.sub(r'[0-9].[0-9][0-9]e-',"", evalue))
    if subevalue == 0.0 or subevalue >= 50 and ident >= 95 and algnlen >= 200:
        blastdict[SVnamecut].append(SVname)

for name in blastdict:
    if name in fqdict:
        blastvalues = blastdict[name]
        if len(blastvalues) == len(set(blastvalues)):
            fastqvalues = fqdict[name]
            if len(blastvalues) == len(fastqvalues):
                keeplist.append(name)

for vline in vcfin:
    vline = vline.strip()
    if vline.startswith("#"):
        vcfout.write(vline+"\n")
        
    else:
        vline_parts = vline.split("\t")
        vcfname = vline_parts[0]+"_"+vline_parts[1]
        if vcfname in keeplist:
            vcfout.write(vline+"\n")
            if len(vline_parts[3]) == 1:
                keepout.write(vline_parts[0]+"\t"+vline_parts[1]+"\n")
            else: 
                vstop = int(vline_parts[1]) + len(vline_parts[3])-1
                keepout.write(vline_parts[0] + "\t" + "SV_START:" + vline_parts[1] + "-SV_STOP:" + str(vstop) + "\n")


vcfout.close()
keepout.close()

