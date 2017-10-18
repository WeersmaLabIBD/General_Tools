#Creator: Arnau Vich
#Year:2015
#Usage: Command line
#Combines two files using the first column of each file

awk ' FNR==NR { a[$1]=$1; next } $1 in a { print a[$1] “\t” $0 }'  $index.txt $INPUT.txt  > $OUTPUT.txt
