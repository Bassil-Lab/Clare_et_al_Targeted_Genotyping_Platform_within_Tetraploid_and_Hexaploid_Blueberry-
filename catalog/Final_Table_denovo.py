#!/usr/bin/env python


##########################
##Final_Table_denovo.py##
##########################


###Imports###
import argparse
import itertools
from  itertools import chain
from collections import defaultdict

def get_arguments():
    parser = argparse.ArgumentParser(description="Will add discription later")
    parser.add_argument("-hc","--hard_core",help="-hc [path/file], Add later.")
    parser.add_argument("-sc","--soft_core",help="-sc [path/file], Add later.")
    parser.add_argument("-g","--gff",help="-g [path/file], Add later.")
    parser.add_argument("-f","--filt_file",help="-f [path/file], Add later.")
    parser.add_argument("-t","--table1_file",help="-t [path/file], Add later.")
    parser.add_argument("-o","--out",help="-o [path/file], Add later.")
    return parser.parse_args()

args = get_arguments()
hard_core = args.hard_core
soft_core = args.soft_core
gff = args.gff
filt_file = args.filt_file
table1_file = args.table1_file
out = args.out


###File Variables###
##In file##
#hardcorefile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/W85_Hard_Core_P0_4BB.txt"
#softcorefile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/W85_Soft_Core_P0_4BB.txt"
#gfffile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/vcae1.4.gff3"
#filteredSNPfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/single_mapping_Chrom_pos_Vcev1_p0.Chr01.txt"
#table1file = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/Table1_files_Vcev1_p0.Chr01.txt"

##Out file##



###Opening Files###
##In file##
hard = open(hard_core, "r")
soft = open(soft_core, "r")
gff = open(gff, "r")
filtfile = open(filt_file, "r")
table1 = open(table1_file, "r")
table2 = open(out, "w")

###Lists, Dictionaries and Global Variables###
hardcorelist = []
softcorelist = []
coredict = defaultdict(list)
chrom = filtfile.readline().split()[0]
namelist = []
expandedfiltlist = []
expandedtablelist = []

###Classes####
class CoreParts:
    def __init__(self,gffline):
        self.gffline = gffline
    
    def get_gffline_parts(self):
        gffline = self.gffline.strip().split("\t")
        gfftype = gffline[2]
        info = gffline[8]
        infoparts = info.split(";")
        idparts = infoparts[0].split("=")
        ID = idparts[1]
        return ID, gfftype, gffline

class MakeDataParts:
    def __init__(self, line):
        self.line = line
        
    def make_start_stop(self):
        chrom = self.line[0]
        pos = self.line[1].replace("SV_START:","").replace("SV_STOP:","")
        return chrom, pos
    
    def make_start_stop_table(self):
        chrom = self.line[1]
        pos = self.line[2]
        return chrom, pos
    
    def make_name(self):
        chrom,pos = self.make_start_stop()
        name = chrom + "_" + pos
        return name
               
    def make_expanded_name_list(self):
        chrom,pos = self.make_start_stop()
        posparts = pos.split("-")
        expandedSVlist = [posparts if len(posparts) == 1 else list(range(int(posparts[0]),int(posparts[1])+1))][0]
        expandedSVnamelist = [chrom+"_"+str(i) for i in expandedSVlist]
        return expandedSVnamelist
    
    def make_expanded_name_list_table(self):
        chrom,pos = self.make_start_stop_table()
        posparts = pos.split("-")
        expandedSVlist = [posparts if len(posparts) == 1 else list(range(int(posparts[0]),int(posparts[1])+1))][0]
        expandedSVnamelist = [chrom+"_"+str(i) for i in expandedSVlist]
        return expandedSVnamelist

class GFFData:
    
    def __init__(self, chromposlist, coredict):
        self.chromposlist = chromposlist
        self.coredict = coredict
        
    def get_gene_parts(self):
        corelist = []
        sv_parts = [i.split("_") for i in self.chromposlist]
        chrompos = [(j[0]+"_"+j[1],j[2])  for j in sv_parts]
        for k, v in self.coredict.items():
            corevals = [i for i in v for j in chrompos if j[0] in i[0] and int(i[3]) <= int(j[1]) <= int(i[4])]
            corelist.append(corevals)
        noemptylist = [x for x in corelist if x]
        return noemptylist, corelist
    
    def get_core(self):
        noemptylist, corelist = self.get_gene_parts()
        if noemptylist == []:
            return "INTERGENIC"
        else:
            index = [i for i,j in enumerate(corelist) if j != []]
            core = [j for i,j in enumerate(list(self.coredict)) for k in index if k == i]
            joinedcore = ",".join(core)
            return joinedcore
        
    def get_gene(self):  
        noemptylist, corelist = self.get_gene_parts()
        if noemptylist == []:
            return "-"
        else:
            noduplist = [list(i) for i in set(tuple(i) for j in noemptylist for i in j)]
            infoparts = [i[8].split(";")[0] for i in noduplist]
            genes = [i.split("=")[1] for i in infoparts]
            genes = ",".join(genes)
            return genes
        
    
###Body###

#Creating Dictionary with each core###
for hline in hard:
    hline = hline.strip().replace(".mRNA", "")
    #print(hline)
    hardcorelist.append(hline)
    
for sline in soft:
    sline = sline.strip().replace(".mRNA", "")
    #print(sline)
    softcorelist.append(sline)

for gffline in gff:
    getgffparts = CoreParts(gffline)
    ID, gfftype, gffline = getgffparts.get_gffline_parts()
    if gfftype == "gene":
        if ID not in hardcorelist and ID not in softcorelist:
            coredict["DISPOSABLE"].append(gffline)
        elif ID in hardcorelist:
            coredict["HARD"].append(gffline)
        elif ID in softcorelist:
            coredict["SOFT"].append(gffline)             


##Creating two list that has all filtered names and SVs, respectively##       
for fline in filtfile:
    fline = fline.strip().split()
    makeflineparts = MakeDataParts(fline)
    fname = makeflineparts.make_name()
    fnamelist = makeflineparts.make_expanded_name_list()
    namelist.append(fname)
    expandedfiltlist.append(fnamelist)
    
##Creating list that has all the shared SVs from Table1##   
for tline in table1:
    tline = tline.strip().split("\t")
    gettableparts = MakeDataParts(tline)
    tchrom, tpos = gettableparts.make_start_stop_table()
    expandedtablenames = gettableparts.make_expanded_name_list_table()
    expandedtablelist.append(expandedtablenames)
    

unraveltableSV = [item for sublist in expandedtablelist for item in sublist] 

##Identifying only de nono SVs and writing Table 2##
for name,namelist in zip(namelist,expandedfiltlist):
    tablefoundindenovo = list(set(namelist).intersection(unraveltableSV))
    if tablefoundindenovo == []:
        
        
        nameparts = name.split("_")
        gettableinfo = MakeDataParts(nameparts)
        namechrom, namepos = gettableinfo.make_start_stop_table()
        
        getGFFdata=GFFData(namelist, coredict)
        
        cores = getGFFdata.get_core()
        genes = getGFFdata.get_gene()
        
        #print(name +"\t"+ namechrom +"\t"+ namepos +"\t"+ "D" +"\t"+ "0/0/0" +"\t"+ "0/0/0" +"\t" + cores +"\t"+ genes)
        
        table2.write(name +"\t"+ namechrom +"\t"+ namepos +"\t"+ "D" +"\t"+ "0/0/0" +"\t"+ "0/0/0" +"\t" + cores +"\t"+ genes + "\n")

table2.close()
