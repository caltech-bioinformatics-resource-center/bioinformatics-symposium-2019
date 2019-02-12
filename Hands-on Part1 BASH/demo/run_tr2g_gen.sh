#!/bin/bash
fasta=$1
if [ $fasta == *gz ];then 
   zcat $fasta | awk '{if($1~/>/)print $1"\t"$4"\t"$7}' > tr2g.txt
else cat $fasta | awk '{if($1~/>/)print $1"\t"$4"\t"$7}' > tr2g.txt
fi
sed -i 's/>//g' tr2g.txt
sed -i 's/gene://g' tr2g.txt
sed -i 's/gene_symbol://g' tr2g.txt
