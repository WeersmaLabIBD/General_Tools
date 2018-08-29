#using awk to merge two files based on two or more columns
#for example:
#file 1
chr Pos Info
1 123456  APOE
1 228372 APOA
2 582982 PPARG
8 275928 GAPDH
19 983475 ACTB

#file 2
chr Pos  Info DP
1 123456  APOE  999999999
1 228372 APOA 888888888
6 39847593 FUT2 394859384

#output
chr Pos Info  DP
1 123456  APOE 999999999
1 228372 APOA 888888888

awk 'NR==FNR{a[$1,$2]=$3,next}($1,$2) in a{print $0, a[$1,$2]}' file1.txt file2.txt > outcome.txt
