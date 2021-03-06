#!/bin/bash
input_pairs=$1
restriction_file=$2  # Juicer format
output_prefix=$3

scriptdir=/usr/local/bin
gunzip -c $input_pairs | $scriptdir/pairix/util/fragment_4dnpairs.pl -a - $output_prefix.ff.pairs $restriction_file
bgzip -f $output_prefix.ff.pairs
pairix -f $output_prefix.ff.pairs.gz
