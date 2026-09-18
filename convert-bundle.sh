#!/bin/bash
set -euo pipefail

curl -o tartest.tar.gz https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzf tartest.tar.gz

# awk can remove blank / whitespace-only lines
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

#awk to replace commas with tabs
awk '{ gsub(/\t/, ","); print }' cleaned.tsv > cleaned.csv

lines_remaining=$(($(wc -l < cleaned.csv) - 1))
echo "Lines remaining in dataset: $lines_remaining"

#new tarball
tar -czf converted-archive.tar.gz cleaned.csv
