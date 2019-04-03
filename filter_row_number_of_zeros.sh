#Author: Arnau Vich
#Description: Recommended for large files. It filters each row by the percentage of zeros. 

 less $input.txt | awk -F "\t" '{ zeroes=0; for( i=1; i<NF; i++ ) { if( $i == 0 ) {zeroes++} } if( zeroes / (NF-1) < 0.9 ) { print $0 } }' >> $out_filt.txt
