#! /usr/bin/env python

import glob
from Bio import SeqIO
listing = glob.glob('miseq/*header.txt')
for filename in listing:
	header_file = open('%s' % filename, 'r')
	headers = header_file.readlines()
	sra_file = filename.replace('miseq', 'sra')
	sra_file2 = sra_file.replace('_header.txt', '.fastq')
	sra_output = sra_file.replace('.txt', '.fastq')
	counter = 0
	output_records = []
	for record in SeqIO.parse('%s' % sra_file2, "fastq"):
		record.id = headers[counter]
		output_records.append(record)
		counter += 1

	SeqIO.write(output_records, '%s' % sra_output, 'fastq')