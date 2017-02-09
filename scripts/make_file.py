#! /usr/bin/env python

"""
This script is intended to take a directory and create a file needed for the mothur make.contigs command. The created file has three tab delimited columns: sample id, forward fastq, reverse fastq.
The input directory should only contain the fastq files of interest. It searches for both fastq.gz and .fastq file suffixes, taking all that match the two patterns.

The output file from this script is fileList.paired.txt and fileList.single.txt

Use '-h' for parameter help.

% python make_file.py -d=<dir>

"""
import argparse
import sys
import os
import re

parser = argparse.ArgumentParser(description='create file for input to mothur make.contigs command')
parser.add_argument('-d', '--dir', help='directory containing sequence files (and nothing else)', type=str, required=True)
args = parser.parse_args()

abs_dir = os.path.abspath(args.dir)

fastq1 = [filename for filename in os.listdir(args.dir) if bool(re.search(r'R1_[0-9]{3}\.fastq(\.gz)?', filename))]

fastq2 = [filename for filename in os.listdir(args.dir) if bool(re.search(r'R2_[0-9]{3}\.fastq(\.gz)?', filename))]


paired_out = open('fileList.paired.txt', 'wb')
single_out = open('fileList.single.txt', 'wb')

for f1 in fastq1:
    abs_filename1 = os.path.join(abs_dir, f1)
    f1_id = f1.split('_')
    f2 = re.sub(r'_R1_', '_R2_', f1)
    abs_filename2 = os.path.join(abs_dir, f2)
    if f2 in fastq2:
        paired_out.write(f1_id[1] + '\t' + abs_filename1 + '\t' + abs_filename2 + '\n')
    else:
        single_out.write(f1_id[1] + '\t' + abs_filename1 + '\n')
        print "\nWarning: %s did not have both a forward and reverse file\n" % f1

for f2 in fastq2:
    f2_id = f2.split('_')
    f1 = re.sub(r'_R2_', '_R1_', f2) 
    abs_filename2 = os.path.join(abs_dir, f2)
    if f1 not in fastq1:
        single_out.write(f2_id[1] + '\t' + abs_filename2 + '\n')
        print "\nWarning: %s did not have both a forward and reverse file\n" % f2

print "\nOutputs:\nfileList.paired.txt\nfileList.single.txt\n"

paired_out.close()
single_out.close()

