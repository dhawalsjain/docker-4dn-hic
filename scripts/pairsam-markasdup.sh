#!/usr/bin/env bash
if [ $# -le 2 ] ; then
    echo "Usage: bash pipeline_markasdup.sh PAIRSAM OUTPUT_PREFIX"
    echo ""
    echo "An example of markasdup pipeline for marking duplicates in a given pairsam file"
    echo ""
    echo "positional arguments:"
    echo ""
    echo "PAIRSAM             The path to a PAIRSAM file."
    echo "OUTPUT_PREFIX       The prefix to the paths of generated outputs. "
    echo ""
    echo ""

    exit 0
fi
set -o errexit
set -o nounset
set -o pipefail

PAIRSAM=$1
OUTPREFIX=$2
MARKED_PAIRSAM=${OUTPREFIX}.marked.sam.pairs.gz
pairsamtools dedup --mark-dups --output ${MARKED_PAIRSAM} ${PAIRSAM}

