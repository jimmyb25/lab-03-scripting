#!/bin/bash
set -euo pipefail

# Usage: ./analyze-moby-dick.sh <search_pattern> <output_file>

#command line input variables
SEARCH_PATTERN="$1"
OUTPUT="$2"

curl -o mobydick.txt https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt

OCCURENCES=$(grep -o $SEARCH_PATTERN mobydick.txt | wc -l)

echo "The search pattern $SEARCH_PATTERN was found $OCCURENCES time(s)." > $OUTPUT

