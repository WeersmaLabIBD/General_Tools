#!/usr/bin/python

# Creator: Arnau Vich 
# Year: 2017

# Description: Clean the header of a FASTA/FASTQ file. Useful for QIIME pipeline, transform headers like this ">Sample1.merged.bla.bla.4 more bla bla bla" to ">Sample1_4 more bla bla bla"

### USAGE ###

# python clean_fasta_header.py $input > output


import sys
import re

input_file= open (sys.argv[1],'r')


count_line= 1
sep='.'
fasta='>'
count=0
#name=sys.argv[1]
#sample_id=name.split(sep, 1)[0]

with open(sys.argv[1]) as input_file:
	for i, line in enumerate(input_file):
		#Select header lines (first character ">")
		if line.startswith(">"):
      #Remove new line symbol
		line=re.sub('\n', '', line)
			# Split header: separator is space, replace for "\t" in case of tab separation
		old_id=line.split(" ")
			#Select first word in the header 
		old_id_t=old_id[0]
			#Select second word in the header
		old_1=old_id[1]
		old_2=old_id[2]
		old_3=old_id[3]
			#Select fourth word in the header
		old_4=old_id[4]
			#Get the first part of the first word/string that is separated by a dot "."
 		id=old_id_t.split('.')[0]
			#Get the fourth part of the first word/string that is separated by a dot "."
		count=old_id_t.split('.')[4]
			#sample_id=line.split(sep, 1)[0]
			#old_id=line[2:]
			# Merge both first and fourth part and separate them by "_"
 		count2=count.split("_", 1)[-1]
			# Reprint the header with the fixed id name
		print "%s_%s %s %s %s %s" % (id,count2,old_1,old_2,old_3,old_4)
			#print'\n'
		else: 
			line=re.sub('\n', '', line)
			print line
