#!/usr/bin/env python


import argparse
from collections import defaultdict

def get_arguments():
    parser = argparse.ArgumentParser(description="This is a program that takes 3 arguments: A fasta file, vcf, and outfile. It will generate a fastq with the SV(s) and flanking referance sequences of 200 bps in length.")
    parser.add_argument("-f","--fasta",help="-f [path/file], Requires a string that contains the path and fasta file name.") 
    parser.add_argument("-v","--vcf", help="-v [path/file], Requires a string that contains the path and vcf file name.") 
    parser.add_argument("-o","--out", help="-o [path/file], Requires a string that contains the path and out file name.") 
    return parser.parse_args()
    
args = get_arguments()
fasta = args.fasta
vcf = args.vcf
out = args.out
                                    
fastadict = {}
vcfdict = defaultdict(list)


f_file = open(fasta, "r")
v_file = open(vcf, "r")
o_file = open(out, "w")


for fline in f_file:
    fline =fline.strip()
    if fline.startswith(">"):
        header=fline.replace('>', '')
    else:
        seq = fline
        
        fastadict[header]=seq
        
    
for vline in v_file:
    vline = vline.strip()
    if vline.startswith("#"):
        continue 
    else:
        vline_parts = vline.split("\t")
        chrom = vline_parts[0]
        pos = int(vline_parts[1])
        sv = vline_parts[4]
        ref_seq_len = len(vline_parts[3])
        sv_list = sv.split(",")
        ctr = 0
        for i in sv_list:
            ctr += 1
            tupe = (pos, ref_seq_len, i, ctr)
            vcfdict[chrom].append(tupe)
        
for vcfchrom,vcfpos in vcfdict.items():
    seq = fastadict.get(vcfchrom, None)
    if seq:
        for ventry in vcfpos:
            vpos, ref_len, SV, sv_ctr = ventry
            up = seq[(vpos-201):(vpos-1)]
            down = seq[(vpos+ref_len-1):(vpos+ref_len-1+200)]
            SV_seq = up + SV + down
            qual = len(SV_seq) * "*"
            header = "@" + vcfchrom + "_" + str(vpos) + "_" + str(sv_ctr)
            
            o_file.write(header + "\n" + SV_seq + "\n" "+" "\n" + qual + "\n")
            

o_file.close()           

