#!/usr/bin/env python 

###Version 04.07.2021###
###Find_SV_Positions.py###

#############
###Imports###
#############

import re
from collections import defaultdict
from re import search
import collections


######################
###Global Variables###
######################

##in files##

SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Massimo/1M_double_calls_SNP_file.txt"

#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Massimo/SNP_file_RxA.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Ebrahiem/Ebrahiem_ddRADSeq_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Ebrahiem/Ebrahiem_CaptureSeq_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Patricio/Patricio_SNPs_QTLintervals_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Patricio/Patricio_SNPs_GWAS_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Kalpalatha_Melmaiee/Latha_92K_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Jeannine_Rowland/SNP_file_Lisa_Rowland.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Driscolls/driscolls_Data2Bio_SNP_file.txt" 
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Blackberry_KASP_sequences_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Rubus_array_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/SNP_BreedingInsight_documentation/BI_DARTtag_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Hamid_Ashrafi/Ashrafi_Allegro_SNPs_SNP_file.txt"
#SVfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/SV_file.txt"

samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Massimo/1M_double_calls_SNPs.sam"

#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Massimo/sorted_MossimoSNP_RxA.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Ebrahiem/sorted_BabikerSNP_ddRADseq.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Ebrahiem/sorted_BabikerSNP_captureseq.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Patricio/sorted_Patricio_SNPs_QTLintervals.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Patricio/sorted_Patricio_SNPs_GWAS.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Kalpalatha_Melmaiee/sorted_Latha_92K_SNPs.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Jeannine_Rowland/sorted_RowlandSNP.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Driscolls/driscolls_Data2Bio_SNPs.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Blackberry_KASP_sequences.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/sorted_Rubus_array_sequences.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/SNP_BreedingInsight_documentation/sorted_BI_DARTtag.sam"
#samfile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/SV.sam"

#fastafile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Hillquist_genome_v1_purged_primary_contigs_HiC_singleline.fasta"
#fastafile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/normalized_Rubus_occ_V3_10-12-17.singleline.fasta"
fastafile = "/Users/mandiedriskill/Desktop/USDA/Python_Scripts/Vce1.0.singleline.p0.fasta"

##out files##

visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Mossimo_doublecall_view_alignment_coodinates.txt"
SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Mossimo_doublecall_SNP_positions.txt"

#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Ebrahiem_ddRADseq_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Ebrahiem_ddRADseq_SNP_positions.txt"

#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Ebrahiem_CaptureSeq_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Ebrahiem_CaptureSeq_SNP_positions.txt"

#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Patricio_SNPs_QTLintervals_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Patricio_SNPs_QTLintervals_SNP_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Patricio_SNPs_GWAS_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Patricio_SNPs_GWAS_SNP_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Latha_92K_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Latha_92K_SNP_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Jeannine_Rowland_sequences_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/Jeannine_Rowland_sequences_SV_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Driscolls/driscolls_Data2Bio_sequences_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/Driscolls/driscolls_Data2Bio_sequences_SV_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Blackberry_KASP_sequences_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Blackberry_KASP_sequences_SV_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Rubus_array_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Anton_project/Rubus_array_SV_positions.txt"
#visualalignment = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/BI_DARTtag_view_alignment_coodinates.txt"
#SVpositionfile = "/Users/mandiedriskill/Desktop/USDA/Blueberry_VacCap/Collaborator_data/All_SNP_Positions/BI_DARTtag_SV_positions.txt"


##Global lists##
SVnameslist = []
samnamelist = []

##Global dictionaries##

SVdict = {}
fastadict = {} 
samdict = defaultdict(list)

###################
###Opening files###
###################

##Reading##
inSV = open(SVfile, "r")
insam = open(samfile, "r")
infasta = open(fastafile, "r")

##Writing##
outcoords = open(visualalignment, "w")
SVpositions = open(SVpositionfile, "w")


#############
###Classes###
#############

class check_asserts:        
        
    def check_duplicates(SVnameslist):
        duplicate={}
        for i in SVnameslist:
                ## checking whether the item is already present in dictionary or not
                ## increasing count if present
                ## initializing count to 1 if not present

            duplicate[i]=duplicate.get(i,0)+1

        return [k for k,v in duplicate.items() if v>1]
    
    def check_special_characters(seq):
        found = re.split(r'\W', seq)
        return found

class format_SV_sequence:
    def __init__(self, line):
        self.line = line
    
    def strip_line(self):
        line = self.line.strip()
        lineparts = line.split("\t")
        return lineparts
        
    def get_upper(self):
        lineparts = self.strip_line()
        
        for i in range(1,len(lineparts)):
            lineparts[i] = lineparts[i].upper()
        return lineparts

    def convert_IUPAC(self):
        IUPACdict = {'R': 'N', 'Y': 'N', 'S': 'N', 'W':'N', 'K': 'N', 'M': 'N', 'B': 'N', 'D': 'N', 'H': 'N', 'V': 'N'}
        lineparts =self.get_upper()
        for i in range(1,len(lineparts)):
            lineparts[i] = "".join(IUPACdict.get(base, base) for base in lineparts[i])
        return lineparts
        

class make_reverse:
    def __init__(self, samflag, samseq):
        self.samflag = samflag
        self.samseq = samseq
    
    def reverse_compliment(self):
        complementdict = {'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A', "[": "]", "]": "["}
        
        if ((int(self.samflag) & 16) != 16):
            return self.samseq
        
        elif ((int(self.samflag) & 16) == 16):
            reversecomplement = "".join(complementdict.get(base, base) for base in reversed(self.samseq))
            return reversecomplement  
        
        
class make_cigar_lists:
    def __init__(self, samcigar):
        self.samcigar = samcigar
    
    def get_cigar_numbers(self):
        numberlist = (re.findall('\d+', self.samcigar))
        return numberlist
    
    def get_cigar_letters(self):
        letterlist = (re.findall("[a-zA-Z]+", self.samcigar))
        return letterlist

class make_pos_list:
    def __init__(self, samcigar, adjstartpos):
        self.samcigar = samcigar
        self.adjstartpos = adjstartpos
        
    def make_position_index(self):
        getlist = make_cigar_lists(self.samcigar)
        cigarletterlist = getlist.get_cigar_letters()        
        cigarnumberlist = getlist.get_cigar_numbers()
        
        nonclippingopperations = ["M","D","N","=","X", "I", "P"]
        clippingopperations=["S","H"]
        noevalualtion = ["I", "P"]
        refcosumptionoperations = ["M","D","N","=","X",]
        seqwithclipping = []
        splitnocliplist = []
        
        for letter,number in zip(cigarletterlist, cigarnumberlist):
        
            for noclipopp in nonclippingopperations:
                if letter == noclipopp:
                    noclipseq = letter* int(number)
                    seqwithclipping.append(noclipseq)
                    
            for clipopp in clippingopperations:
                if letter == clipopp:
                    clipseq = int(number) * "*"
                    seqwithclipping.append(clipseq)
               
        joinednoclipopp = ("".join(seqwithclipping))
        splitnocliplist[:0] = joinednoclipopp
        ctr=0
        ctr2=0
        ctr3 = 0
        oppindexlist = []
        for item in splitnocliplist:
            if item == "*":
                    ctr2+=1
                    oppindexlist.append(item)

            for noeval in noevalualtion:
                if item == noeval:
                    ctr+=1
                    oppindexlist.append(item)

            for cosumopps in refcosumptionoperations:

                if item == cosumopps:
                    ctr3+=1
                    oppindexlist.append(ctr3 + self.adjstartpos)
                    
        joinedoppindex = (','.join(str(x) for x in oppindexlist))

        findinnerindexes= re.findall('([a-zA-Z]+,)(\d+)', joinedoppindex)

        for founditem in findinnerindexes:
            foundletter = (founditem[0])
            foundletter = foundletter.strip(",")
            foundnumber  = (founditem[1])

            for index, indexletter in enumerate(oppindexlist):
                if indexletter == foundletter:
                    oppindexlist[index] = foundnumber
        
        return  oppindexlist    
    
class make_ref_slice:
    def __init__(self, samcigar, samstartpos, samchrom):
        self.samcigar = samcigar
        self.samstartpos = samstartpos
        self.samchrom = samchrom
                
    def get_stop(self):
        Ssum = sum(list(map(int,re.findall(r'(\d+)S', self.samcigar))))
        Msum = sum(list(map(int,re.findall(r'(\d+)M', self.samcigar))))
        Dsum = sum(list(map(int,re.findall(r'(\d+)D', self.samcigar))))
        Isum = sum(list(map(int,re.findall(r'(\d+)I', self.samcigar))))
        Nsum = sum(list(map(int,re.findall(r'(\d+)N', self.samcigar))))
        equalsum = sum(list(map(int,re.findall(r'(\d+)=', self.samcigar))))
        Xsum = sum(list(map(int,re.findall(r'(\d+)X', self.samcigar))))
        Psum = sum(list(map(int,re.findall(r'(\d+)P', self.samcigar))))
        Hsum = sum(list(map(int,re.findall(r'(\d+)H', self.samcigar))))
        samstopsum = int(Msum+Dsum+Nsum+equalsum+Xsum)-1
        samstoppos = (self.samstartpos) + (samstopsum)
        return samstoppos
    
    def get_fasta_seq(self, fastadict):
        samstoppos = self.get_stop()
        
        for header, seq in fastadict.items():
            if header == self.samchrom:
                fastaslice = seq[(samstartpos-1):samstoppos]
                return fastaslice

class make_ref_lists:
    def __init__(self, samcigar, refslice):
        self.samcigar = samcigar 
        self.refslice = refslice
        
    def make_ref_seq(self):
        getlist = make_cigar_lists(self.samcigar)
        cigarletterlist = getlist.get_cigar_letters()        
        cigarnumberlist = getlist.get_cigar_numbers()         
        
        refcosumptionoperations = ["M","D","N","=","X",]
        norefcosumptionoperations=["S","I","P","H"]
        refcigaropplist =[]
        splitopplist = []
        
        for letter,number in zip(cigarletterlist, cigarnumberlist):
            for refconletter in refcosumptionoperations:
                if letter == refconletter:
                    consumptionseq = letter * int(number)
                    refcigaropplist.append(consumptionseq)
                    
            for norefconletter in norefcosumptionoperations:
                if letter == norefconletter:
                    noconsumptionseq = int(number) * "*"
                    refcigaropplist.append(noconsumptionseq)
                    
        joinedcigaropp = ("".join(refcigaropplist))
        splitopplist[:0] = joinedcigaropp
        return splitopplist
    
    def ref_opp_list(self):
        refsplitopplist = self.make_ref_seq()
                
        ctr=0
        oppindexlist = [] 
        refslicelist = []
        baseindex={}
        for item in refsplitopplist:
            if item == "*":
                oppindexlist.append(item)
            else:
                ctr+=1
                oppindexlist.append(ctr)
        refslicelist[:0] = self.refslice

        ctr2=0
        for base in refslicelist:
            ctr2+=1
            baseindex[ctr2]=base

            reflist=[baseindex[i] if i in baseindex else i for i in oppindexlist]

        return reflist

class make_query_lists:
    def __init__(self, samflag, samcigar, subject, query):
        self.samflag = samflag
        self.samcigar = samcigar 
        self.subject = subject
        self.query = query
                
    def make_query_seq(self):
        getlist = make_cigar_lists(self.samcigar)
        cigarletterlist = getlist.get_cigar_letters()        
        cigarnumberlist = getlist.get_cigar_numbers()        
        
        altcosumptionoperations = ["S","M","I","=","X"]
        noaltcosumptionoperations=["D","N","P","H"]
        cigaropplist = []
        splitopplist=[]
        
        for letter,number in zip(cigarletterlist,cigarnumberlist):
            for altconletter in altcosumptionoperations:

                if letter == altconletter:
                    consumptionseq = letter * int(number)
                    cigaropplist.append(consumptionseq)
                    
            for noaltconletter in noaltcosumptionoperations:
                if letter == noaltconletter:
                    noconsumptionseq = int(number) * "*"
                    cigaropplist.append(noconsumptionseq)
                    
        joinedcigaropp = ("".join(cigaropplist))
        splitopplist[:0] = joinedcigaropp
        return splitopplist
    
    def repace(self):
        subjectreplace = self.subject.replace("]","[")
        subjectparts = subjectreplace.split("[")
        return subjectparts
    
    def make_newsubject(self):
        subjectparts = self.repace()
        newsubject = f'{subjectparts[0]}{subjectparts[1]}{subjectparts[2]}'
        return newsubject
        
    def get_SV(self):
        subjectparts = self.repace()
        return subjectparts[1]

    def align_seq(self):
        newsubject = self.make_newsubject()
        
        ##hamming distance##
        updatedsplicelist = []
        base_counter = -1
        d = lambda s1, s2: sum(e1 != e2 for e1, e2 in zip(s1, s2)) 

        for i in range(len(newsubject)-len(self.query)+1):
            aligned_subject = newsubject[i:i+len(self.query)]
            
            if d(aligned_subject, self.query) == 0:
                listrange = [num for num in range(i,i+len(aligned_subject))]
        
                for base in self.subject:
                    if base.isalpha():
                        base_counter+=1
                        
                        if base_counter in listrange:
                            updatedsplicelist.append(base)
                            

                    if not base.isalpha():
                        if base_counter in listrange:
                            updatedsplicelist.append(base)
        
        updatedsplice = "".join(updatedsplicelist)
        return updatedsplice

    def get_query_list(self):
        SV = self.get_SV()
        splice = self.align_seq()

        getreverse = make_reverse(self.samflag, splice)
        updatedsplice = getreverse.reverse_compliment()
        
        if len(SV)>1:
            SVlist = [''.join(tup) for tup in re.findall(r'(\[\w+?)|(\w\])|(\w)', updatedsplice)]
            return SVlist
        
        else:
            SVlist = [''.join(tup) for tup in re.findall(r'(\[\w+?\])|(\w)', updatedsplice)]
            return SVlist

    def alt_opp_list(self):
        altsplitopplist = self.make_query_seq()
        alignmentlist = self.get_query_list()
        
        ctr=0
        oppindexlist = [] 
        baseindex={}

        for item in altsplitopplist:
            if item == "*":
                oppindexlist.append(item)
            else:
                ctr+=1
                oppindexlist.append(ctr)
                
        ctr2=0
        for base in alignmentlist:
            ctr2+=1
            baseindex[ctr2]=base
                
            querylist=[baseindex[i] if i in baseindex else i for i in oppindexlist]
        return querylist

    def get_SV_positions(self, refindex):
        SV = self.get_SV()
        SVlist = self.get_query_list()
        querylist = self.alt_opp_list()

        if len(SV)>1:
            substringA = re.compile("(\[\w+)")
            substringB = re.compile("(\w\])")
            
            for base, pos in zip(querylist,refindex):
                if substringA.search(base):
                    posstart = pos
                    if posstart == "*":
                        posstart = "None"

            
                if substringB.search(base):
                    posstop = pos
                    if posstop == "*":
                        posstop = "None"
                        
                    return f'SV_START:{posstart} SV_STOP:{posstop}'
        else:
            substring = re.compile("(\[\w+?\])")
            for base, pos in zip(querylist,refindex):
                if substring.search(base):
                    return f'SNP_POS:{pos}'

    
class alignment_types:
    def __init__(self, samflag):
        self.samflag = samflag
    
    def primar_secondary_alignments(self):
        if ((int(self.samflag) & 2048) == 2048):
            return ("secondary")
        
        elif ((int(self.samflag) & 2048) != 2048):
            return ("primary")

    def forward_reverses_alignments(self):
        if ((int(self.samflag) & 16) != 16):
            return ("forward")
        
        elif ((int(self.samflag) & 16) == 16):
            return ("reverse")


##########
###Body###
##########

for SVline in inSV:
    if SVline.startswith("query_name"):
        continue
        
    else:
        
        formatline = format_SV_sequence(SVline)
        SVlineparts = formatline.convert_IUPAC()  
        SVname = SVlineparts[0]
        SVseq = SVlineparts[1]
        SVnameslist.append(SVname)
        ###assert###
        assert len(check_asserts.check_special_characters(SVseq)) == 3, "Query Sequence is not formatted correctly in SNP file, see manual for SNP file format"
        SVdict[SVname] = SVseq

###assert###
assert len(check_asserts.check_duplicates(SVnameslist)) <= 0, "Duplicate query names identified in SNP file, please make each query name unique before alignment"       
        
        
        
        

for fastaline in infasta:   
    fastaline = fastaline.strip()
    if fastaline.startswith(">"):
        fastaheader = fastaline.strip(">")
        
    else:
        fastaseq = fastaline
        fastadict[fastaheader] = fastaseq
        
for samline in insam:
    if samline.startswith("@"):
        continue
        
    else:
        strip = format_SV_sequence(samline)
        samlineparts = strip.strip_line()
        samname = samlineparts[0]
        seqsam = samlineparts[9]
        samnamelist.append(samname)
        samdict[samname].append(samlineparts)

SVpositions.write(f'query_name\talignment\torientation\tchrom\tSV_pos\tquery_sequence\n')

for nameSV, seqSV in SVdict.items():
    for namesam, linesam in samdict.items():
        for alignmentparts in linesam:
            
            
            if nameSV == namesam:
                
                samflag = alignmentparts[1]
                samseq = alignmentparts[9]
                samchrom = alignmentparts[2]
                samstartpos = int(alignmentparts[3])
                adjstartpos = int(samstartpos - 1)
                samcigar = alignmentparts[5]
                samseq = alignmentparts[9]
                
                if ((int(samflag) & 4) == 4):
                    SVpositions.write(f'{nameSV}\tunmapped\tNone\tNone\tNone\t{seqSV}\n')
                    
                    
                if ((int(samflag) & 4) != 4):
                    getreverse = make_reverse(samflag, samseq)
                    query = getreverse.reverse_compliment()
                     
                    
                    
                    ########################################################
                    ##class make_pos_list##
                    makerefindex = make_pos_list(samcigar,adjstartpos)
                    refposindex = makerefindex.make_position_index()
                    
                    ########################################################
                    ##class make_query_lists##
                    
                    
                    querylists = make_query_lists(samflag, samcigar, seqSV, query) 
                    alignedseq = querylists.align_seq()
                    queoppinddexeslist = querylists.alt_opp_list()
                    SVpos = querylists.get_SV_positions(refposindex)
                    

                    ########################################################
                    ##class make_ref_slice##
                    
                    getref = make_ref_slice(samcigar, samstartpos, samchrom)
                    samstoppos = getref.get_stop()
                    refslice = getref.get_fasta_seq(fastadict)
                    
                    ########################################################
                    ##class make_ref_lists##
                    
                    reflists = make_ref_lists(samcigar, refslice)
                    refoppinddexeslist = reflists.ref_opp_list()
                    
                    ########################################################
                    ##class alignment_types##

                    getalignments = alignment_types(samflag)
                    alignmenttype = getalignments.primar_secondary_alignments()
                    orientationtype = getalignments.forward_reverses_alignments()
                    
                    ########################################################
                    ##Formatting output##
                    
                    coor = '\t'.join(str(x) for x in refposindex)
                    ref = "\t".join(refoppinddexeslist)
                    que = "\t".join(queoppinddexeslist)

                    ########################################################
                    ##writing##
                    
                    outcoords.write(f'query_name: {nameSV}\n')
                    outcoords.write(f'cigar: {samcigar}\n')
                    outcoords.write(f'start: {samstartpos}\n')
                    outcoords.write(f'stop: {samstoppos}\n')
                    outcoords.write(f'SV_pos: {samchrom} {SVpos}\n')
                    outcoords.write(f'Coor:\t{coor}\n')
                    outcoords.write(f'ref:\t{ref}\n')
                    outcoords.write(f'que:\t{que}\n')

                    
                    SVpositions.write(f'{nameSV}\t{alignmenttype}\t{orientationtype}\t{samchrom}\t{SVpos}\t{alignedseq}\n')

outcoords.close()          
SVpositions.close()
