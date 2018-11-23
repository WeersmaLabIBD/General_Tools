#!/bin/python
import sys
#Creating input and output files
input_file= open (sys.argv[1],'r')
output_file= open (sys.argv[2], 'w')
output_file_map= open (sys.argv[3], 'w')
#Flag just for printing the header. 
count_line= 1
#Opening and reading file line per line 
with open(sys.argv[1]) as input_file:
    for i, line in enumerate(input_file):
                if count_line==1:
                        header_info= line.split()
                        fam1="0"
                        fam2="0"
                        stat="-9"
                        for h in header_info:
                                output_file_map.write ('%s' '\t' '%s' '\t''%s' '\t''%s' '\t''%s' '\t''%s' '\n'% (h, h, fam1, fam2, stat, stat))
                        count_line=2
                else:
                        output_file.write('\n')
                        snp_info=line.split()   
                        chromo= snp_info[1]
                        snp= snp_info[0]
                        dist="0"
                        alleles= snp_info[2]
                        sep_alleles= alleles
                        A= sep_alleles[0]
                        B= sep_alleles[1]
                        predictions= snp_info[4:]
                        output_file.write ('%s' '\t' '%s' '\t' '%s' '\t' '%s' % (chromo, snp, dist , dist))
                        for g in predictions:
                                if g == "4":
                                        genotype="0"
                                        output_file.write ('\t''%s' '\t' '%s'  % (genotype, genotype))
                                elif g == "3":
                                        output_file.write ('\t''%s' '\t' '%s' % (B, B))
                                elif g=="2":
                                        output_file.write ('\t''%s' '\t' '%s'  % (A, B))
                                elif g=="1":
                                        output_file.write ('\t''%s' '\t' '%s' % (A, A))
input_file.close()
output_file.close()
