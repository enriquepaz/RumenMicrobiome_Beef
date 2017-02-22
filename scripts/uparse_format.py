#! /usr/bin/env python

"""
This script is intended to take the contigs fasta file and resulting groups file
created from the mothur command make.contigs. In the Fernando Lab 16S pipeline, 
this script is to be used after trimming the contigs based on size and ambiguous bases. 
The result of the script will create a new fasta file with a header line format compatible 
with the UPARSE pipeline.

The output file from this script is contigs_for_uparse.fasta

Use '-h' for parameter help.

% python uparse_format.py -f=<contigs_fasta> -g=<group_file>

"""

import argparse
import sys

parser = argparse.ArgumentParser(description='create contigs fasta file in format for UPARSE pipeline')
parser.add_argument('-f', '--contigs_fasta', help='path to fasta file with 16S contigs (usually after trimming)', type=str, required=True)
parser.add_argument('-g', '--group_file', help='associated mothur groups file', type=str, required=True)
args = parser.parse_args()

group_dict = {}
in_groups = open(args.group_file, 'rU')
for line in in_groups:
    stripline = line.rstrip()
    (seq, samp) = stripline.split('\t')
    group_dict[seq] = samp

in_groups.close()

out_fasta = open('contigs_for_uparse.fasta', 'wb')

count = 0
count_out = 0
in_fasta = open(args.contigs_fasta, 'rU')
for line in in_fasta:
    stripline = line.rstrip()
    if stripline.startswith('>'):
        count += 1
        seq = stripline[1:]
        if seq in group_dict:
            samp = group_dict.get(seq)
            new_head ='>file' + str(count) + ';barcode=' + samp
            out_fasta.write(new_head + '\n')
            count_out += 1
        else:
            sys.exit('\nError: Sequence %s was not found in the group file\n' % seq)
    else:
        out_fasta.write(line)
            
in_fasta.close()
out_fasta.close()

if count == count_out:
    print '\nNumber of sequences read in and printed to contigs_for_uparse.txt were identical: %d\n' % count
else:
    sys.exit('\nError: Number of sequeneces read in and printed out differ, check inputs\n')