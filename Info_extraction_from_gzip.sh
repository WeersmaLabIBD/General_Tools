# snp.txt is interesting list
# $i < target gzip file
# this command is to extract target lines from gzip file

awk ' FNR==NR { a[$1]=$0; next } $2 in a { print }' <(less intersect_snp.txt) <(gzip -dc $i) >> test3.txt
