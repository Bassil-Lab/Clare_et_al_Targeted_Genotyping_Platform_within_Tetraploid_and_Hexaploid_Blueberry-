#!/usr/bin/env python

##########################
##Final_Table_shared.py##
##########################


###Imports###
import argparse
import itertools
import pandas as pd
from  itertools import chain
from collections import defaultdict

###Arge Parse###
def get_arguments():
    parser = argparse.ArgumentParser(description="Will add discription later")
    parser.add_argument("-hc","--hard_core",help="-hc [path/file], Add description.")
    parser.add_argument("-sc","--soft_core",help="-sc [path/file], Add description.")
    parser.add_argument("-g","--gff_file",help="-gff [path/file], Add description.")
    parser.add_argument("-f","--filtered_file",help="-f [path/file], Add description.")
    parser.add_argument("-c","--collab_file",help="-cc [path/file], Add description.")
    parser.add_argument("-o","--output",help="-o [path/file], Add description.")
    return parser.parse_args()


args = get_arguments()
hard_core = args.hard_core
soft_core = args.soft_core
gff_file = args.gff_file
filtered_file = args.filtered_file
collab_file = args.collab_file
output = args.output


###File Variables###
##In file##
#hardcorefile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/W85_Hard_Core_P0_4BB.txt"
#softcorefile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/W85_Soft_Core_P0_4BB.txt"
#gfffile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Pat_Edger/vcae1.4.gff3"
#filteredSNPfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/single_mapping_Chrom_pos_Vcev1_p0.Chr01.txt"
#collabsnpfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/SNP_data/All_collaborator_Transcript_SNP_POS.txt"
##Out file##
#Table1file = ""

###Opening Files###
##In file##
hard = open(hard_core, "r")
soft = open(soft_core, "r")
gff = open(gff_file, "r")
filtfile = open(filtered_file, "r")
collabsnps = open(collab_file, "r")
##Out files##
Table1 = open(output, "w")


###Getting Row Length of Collaborator and Transcript File###
line1 = collabsnps.readline()
lenline1 = len(line1.split("\t"))

###Opening Collaborator and Transcript File to have the same column lengths###
collabdf = pd.read_csv(collab_file, delimiter='\t', names=list(range(lenline1)), dtype='unicode')

###Lists, Dictionaries and Global Variables###
hardcorelist = []
softcorelist = []
coredict = defaultdict(list)
chrom = filtfile.readline().split()[0]
namelist = []
expandedfiltlist = []
collabdict = defaultdict(list)
singledict = defaultdict(list)
multidict = defaultdict(list)


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

class CollabData:
    def __init__(self, collabnamelist, collabinfo):
        self.collabnamelist = collabnamelist
        self.collabinfo = collabinfo
        
    def find_shared_SVs(self, expandedfiltlist):
        value = [bool(i) if i in chain(*expandedfiltlist) else False for i in collabnamelist]
        if True in value: 
            val1 = list(set(["TR" in i for i in self.collabinfo]))
            val1 = [str(i) for i in val1]
            val1 = ["TR" if i == "True" else i for i in val1]
            val1 = "D," + ",".join(["E" if i == "False" else i for i in val1])
            return val1
        else:
            val2 = list(set(["TR" in i for i in self.collabinfo]))
            val2 = [str(i) for i in val2]
            val2 = ["TR" if i == "True" else i for i in val2]
            val2 = ",".join(["E" if i == "False" else i for i in val2])
            return val2
        
    def get_type_count(self):
        MPcount = sum([i.count("MP") for i in self.collabinfo])
        DPcount = sum([i.count("DP") for i in self.collabinfo])
        TRcount = sum([i.count("TR") for i in self.collabinfo])  
        totalcounts = [MPcount, DPcount, TRcount]
        strcounts = [str(i) for i in totalcounts]
        joincounts = "/".join(strcounts)
        return joincounts

    def get_collab_info(self):
        countlist = []
        MPcollab = [i[0] for i in self.collabinfo if i[1]=="MP"]
        DPcollab = [i[0] for i in self.collabinfo if i[1]=="DP"]
        TRcollab = [i[0] for i in self.collabinfo if i[1]=="TR"]
        collablist = [MPcollab, DPcollab, TRcollab]
        noemptycountlist = [ ",".join(i) if i != [] else 0 for i in collablist]
        strcollabs = [str(i) for i in noemptycountlist]
        joincollabs = "/".join(strcollabs)
        return joincollabs

class GFFData:
    
    def __init__(self, chromposlist, coredict):
        self.chromposlist = chromposlist
        self.coredict = coredict
        
    def get_gene_parts(self):
        corelist = []
        getexpandedparts= MakeDataParts(self.chromposlist)
        expandedSVnamelist = getexpandedparts.make_expanded_name_list()
        sv_parts = [i.split("_") for i in expandedSVnamelist]
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

##Creating Dictionary with each core###
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
        #print(gffline, ID)
        if ID not in hardcorelist and ID not in softcorelist:
            coredict["DISPOSABLE"].append(gffline)
        elif ID in hardcorelist:
            coredict["HARD"].append(gffline)
        elif ID in softcorelist:
            coredict["SOFT"].append(gffline)             


##Creating two list that has all filtered names and SVs, respectively##       
for fline in filtfile:
    fline = fline.strip().split()
    #print(fline)
    makeflineparts = MakeDataParts(fline)
    fname = makeflineparts.make_name()
    fnamelist = makeflineparts.make_expanded_name_list()
    namelist.append(fname)
    expandedfiltlist.append(fnamelist)
    
    
##Make Collaborator DF to lists##
collablines = collabdf.values.tolist()
collablist = collablines[0]
typelist = collablines[1]
SVlines = collablines[2:]

##Creating Collaborator Dictionary arranged by shared SV##
for SVline in SVlines:
    for combo in itertools.izip_longest(collablist, typelist, SVline):
        if str(combo[2]) != "nan": 
            comboparts = combo[2].split("_")
            combochrom = comboparts[0]+"_"+comboparts[1]
            if chrom == combochrom:
                collabdict[combo[2]].append([combo[0], combo[1]])

##Creating Collab Data Infomation##
for collabSV in collabdict:
    collabinfo  = collabdict[collabSV]
    #print(collabSV, collabinfo)
    collabSVparts = collabSV.split("_")
    chromposlist = ["_".join(collabSVparts[:2]), "_".join(collabSVparts[2:])]
    
    #Creating collaborator name and SVs#
    makecollablineparts = MakeDataParts(chromposlist)
    collabname = makecollablineparts.make_name()
    collabchrom, collabpos = makecollablineparts.make_start_stop()
    collabnamelist = makecollablineparts.make_expanded_name_list()

    #Identifying shared SVs within collaborators, transcript, and denovo#
    getcollabdata = CollabData(collabnamelist, collabinfo)
    catalog = getcollabdata.find_shared_SVs(expandedfiltlist)
    collabcounts = getcollabdata.get_type_count()
    collabinfocounts = getcollabdata.get_collab_info()
    
    getcoredata = GFFData(chromposlist, coredict)
    core = getcoredata.get_core()
    genes = getcoredata.get_gene()
    #print(collabname +"\t"+ collabchrom +"\t"+ str(collabpos)+"\t"+ collabinfo)
    Table1.write(collabname +"\t"+ collabchrom +"\t"+ str(collabpos) +"\t"+ catalog +"\t"+ collabcounts +"\t"+ collabinfocounts +"\t"+ core +"\t"+ genes + "\n")

Table1.close()
