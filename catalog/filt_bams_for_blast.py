#!/usr/bin/env python


import argparse
import pysam
from collections import defaultdict
from Bio.SeqIO.QualityIO import FastqGeneralIterator


def get_arguments():
    parser = argparse.ArgumentParser(description="This is a program that takes 3 arguments: A fastq file, vcf, and outfile. It will generate a fasta with the SV(s) and flanking referance sequences of 200 bps in length form a previously designed fastq.")
    parser.add_argument("-b","--bam",help="-f [path/file], Requires a string that contains the path and bam file name.") 
    parser.add_argument("-f","--fastq", help="-v [path/file], Requires a string that contains the path and fasta file name.") 
    parser.add_argument("-o","--out", help="-o [path/file], Requires a string that contains the path and out file name.") 
    return parser.parse_args()
    
args = get_arguments()
bam = args.bam
fastq = args.fastq
out = args.out
                                    
s_file = pysam.AlignmentFile(bam, "rb")
f_file = open(fastq, "r")
o_file = open(out, "w")

qname_list=[]

for read in s_file:
    if read.is_supplementary == False:
        if read.has_tag("XA") == False:
            if read.has_tag("SA") == False:
                filtered_read = read
                qname = filtered_read.query_name
                qname_list.append(qname)

for name,seq,qual in FastqGeneralIterator(f_file):
    if name in qname_list:
	o_file.write(">"+name+"\n"+seq+"\n")

o_file.close()

