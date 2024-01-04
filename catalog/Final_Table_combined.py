#!/usr/bin/env python

##########################
##Final_Table_combined.py##
##########################

###Imports###
import argparse
import pandas as pd
from collections import defaultdict


###Classes and Functions###
def get_arguments():
    parser = argparse.ArgumentParser(description="Will add discription later")
    parser.add_argument("-t1","--table1",help="-t1 [path/file], Add description.")
    parser.add_argument("-t2","--table2",help="-t2 [path/file], Add description.")
    parser.add_argument("-c","--collab_info",help="-c [path/file], Add description.")
    parser.add_argument("-o","--out",help="-t2 [path/file], Add description.")
    return parser.parse_args()

class AddCollabInfo:
    
    def __init__(self, collabinfo):
        self.collabinfo = collabinfo

            
    def get_priority_info(self):
        prioritylist = [i[0] for i in self.collabinfo]
        if "1" in prioritylist:
            return 1
        else: 
            return 0
    
    def get_trait_info(self):
        traitlist = [i[1] for i in self.collabinfo]
        traitlist = list(set(traitlist))
        removetrait = [i for i in traitlist if i != "-" ]
        trait = ["-" if removetrait == [] else ",".join(removetrait)][0]
        return trait
        
    def get_reference_info(self):
        reflist = [i[2] for i in self.collabinfo]
        reflist = list(set(reflist))
        removeref = [i for i in reflist if i != "-" ]
        ref = ["-" if removeref == [] else ";".join(removeref)][0]
        return ref


class GetGeneInfo:
    
    def __init__(self, svchrom, svpos, collabinfo):
        self.svchrom = svchrom
        self.svpos = svpos
        self.collabinfo = collabinfo
        
    def make_ranges(self):
        if "-" in self.svpos:
            svpos_parts = self.svpos.split("-")
            svlist = list(range(int(svpos_parts[0]),int(svpos_parts[1])))
            return svlist
        else:
            svlist = [int(self.svpos)]
            return svlist

    def gene_VaccDscaff9_augustus_gene_379_23(self):
        #Vcev1_p0.Chr03    49376401    49384552
        #test 'Vcev1_p0.Chr01 23937801 23937803
        svlist = self.make_ranges()
        for sv in svlist:
            if self.svchrom  == "Vcev1_p0.Chr03" and 49376401 <= sv <= 49384552:
                return 1
            else:
                return 0
            
    def get_final_priority(self):
        vaccgeneinfo = self.gene_VaccDscaff9_augustus_gene_379_23()
        getpriority = AddCollabInfo(self.collabinfo)
        priorityinfo = getpriority.get_priority_info()
        if vaccgeneinfo == 1 or priorityinfo == 1:
            return 1
        else: 
            return 0
    
    def get_final_trait(self):
        vaccgeneinfo = self.gene_VaccDscaff9_augustus_gene_379_23()
        getpriority = AddCollabInfo(self.collabinfo)
        traitinfo = getpriority.get_trait_info()
        if vaccgeneinfo == 1:
            addedgeneinfo = "".join(["VaccDscaff9_gene" if traitinfo == "-" else traitinfo+","+"VaccDscaff9_gene"])
            return addedgeneinfo
        else:
            return traitinfo
        
    
class AddFinalInfo: 
    
    def __init__(self, SVentry, foundcollab, collabSVdict):
        self.SVentry = SVentry
        self.foundcollab = foundcollab
        self.collabSVdict = collabSVdict
    
    def make_chrom_pos(self):        
        svchrom = self.SVentry[1]
        svpos = self.SVentry[2]
        return svchrom, svpos

    def get_final_info(self):
        svchrom, svpos = self.make_chrom_pos()
        if self.foundcollab != []:
            collabinfo = self.collabSVdict.get(self.foundcollab[0], None)
            
            getinfodata = AddCollabInfo(collabinfo)
            citation = getinfodata.get_reference_info()
            
            getgeneinfo = GetGeneInfo(svchrom , svpos, collabinfo)
            priority = getgeneinfo.get_final_priority()
            trait = getgeneinfo.get_final_trait()
            
            allinfolist = [priority, trait, citation]
            self.SVentry.extend(allinfolist)
            
            finalcollabinfo = "\t".join([str(x) for x in self.SVentry])
            
            return finalcollabinfo
        
        else:
            noallinfolist = [["-", "-", "-"]]
            getgeneinfo = GetGeneInfo(svchrom , svpos, noallinfolist)
            priority = getgeneinfo.get_final_priority()
            trait = getgeneinfo.get_final_trait()
            allinfolist = [priority, trait, "-"]
            self.SVentry.extend(allinfolist)
            
            finalnocollabinfo = "\t".join([str(x) for x in self.SVentry])
            
            return finalnocollabinfo
        
        


###Body###
def main():

    args = get_arguments()
    table1 = args.table1
    table2 = args.table2
    collab_info = args.collab_info
    out = args.out    
    
    #tablefile1 = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/Table1_files_Vcev1_p0.Chr01.txt"
    #tablefile2 = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/Table2_file_Vcev1_p0.Chr01.txt"
    #collabadditionalfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/Collab_priority_trait_citation_data.txt"
    #outfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/FinalTable_Vcev1_p0.Chr01_2.txt"

    table_1 = pd.read_csv(table1, delimiter='\t', names=list(range(8)), dtype='unicode')
    table_2 = pd.read_csv(table2, delimiter='\t', names=list(range(8)), dtype='unicode')
    collabfile = pd.read_csv(collab_info, delimiter='\t', names=list(range(4)), dtype='unicode',header=None, skiprows=1)
    finaltable = open(out, "w")


    collabSVdict = defaultdict(list)
    foundnames = []
    allnames = []


    finaltable.write("SV_name" + "\t" + "Chrom" + "\t" + "Pos" + "\t" + "Catalog(D/E/TR)" + "\t" + "Count(MP:DP:TR, respectively)" + "\t" + "Collabors(MP:DP:TR, respectively)" + "\t" + "Core(HARD/SOFT/DISPOSABLE)" + "\t" + "Gene" + "\t" + "Priority(1/0)" + "\t" + "Trait" + "\t" + "Citation" + "\n")        

    SVframes = [table_1, table_2]

    SVconcatdf = pd.concat(SVframes)

    allSVs = SVconcatdf.values.tolist()

    collabinfo = collabfile.values.tolist()


    for collabentry in collabinfo:
        collabsvname = collabentry[0]
        collabdata = collabentry[1:4]
        collabSVdict[collabsvname].append(collabdata)

    collabkeylist = list(collabSVdict.keys())    

    for SVentry in allSVs:
        svname = [SVentry[0]]

        foundcollab = (list(set(svname).intersection(collabkeylist)))
        getfinalinfo = AddFinalInfo(SVentry, foundcollab, collabSVdict)
        #print(getfinalinfo.make_chrom_pos())
        finalSVentry = getfinalinfo.get_final_info()

        finaltable.write(finalSVentry + "\n")

    finaltable.close()  


if __name__ == "__main__":
    main()



