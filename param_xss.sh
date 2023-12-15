#!/bin/bash

# Define help function
usage() {
    echo "Usage: $0 [-t TARGET] [-p PAYLOAD_FILE]"
    echo "Scan a website for XSS vulnerabilities using paramspider and qsreplace."
    echo ""
    echo "Options:"
    echo "  -t, --target        Target website (required)"
    echo "  -p, --payload-file  File containing payloads (required)"
    echo "  -h, --help          Display this help message"
    exit 1
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target)
            target="$2"
            shift
            shift
            ;;
        -p|--payload-file)
            payload_file="$2"
            shift
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Error: Invalid argument $1"
            usage
            ;;
    esac
done

# Check if required arguments are present
if [ -z "$target" ] || [ -z "$payload_file" ]; then
    echo "Error: Target and payload file arguments are required."
    usage
fi

# Loop through each payload in the file
while read payload; do

    # Run paramspider and save the output to "t.json"
    paramspider -d "$target" | tee t.json \

    # Use qsreplace to inject the current payload into each URL parameter
    | qsreplace "$payload" \

    # Loop through each URL and check if it is vulnerable to XSS
    | while read host; do
        curl --silent --path-as-is --insecure "$host" | grep -qs "$payload" \
        && echo "$host \033[0;31mJOKER\n" || echo "$host \033[0;32mBATMAN\n"
    done

done < "$payload_file" | tee "$target-param"

