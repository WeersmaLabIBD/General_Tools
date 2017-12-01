#Creator: Arnau Vich
#Date: 2015
#Usage: Bash command, where $index is a file with 1 column containing id's to extract, $input contains the ids in the header

awk ' FNR==NR { a[$1]=$1; next } $1 in a { print a[$1] “\t” $0 }'  $index.txt $input.txt  > $output.txt
