#! /usr/bin/env python

import glob
from Bio import SeqIO
listing = glob.glob('miseq/*.fastq')
for filename in listing:
	prefix = filename.split('.')
	out_file = open('%s_header.txt' % prefix[0], 'w')
	for record in SeqIO.parse('%s' % filename, "fastq"):
		out_file.write(record.description + '\n')