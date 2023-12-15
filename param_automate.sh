#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <wordlist>"
    exit 1
fi

wordlist=$1

if [[ ! -f "$wordlist" ]]; then
    echo "Error: $wordlist not found"
    exit 1
fi

while read -r target; do
    echo "Scanning $target"
    paramspider -d "$target" | tee "${target}.json" | while read host; do
        echo "Testing $host"
        curl --silent --path-as-is --insecure "$host" | grep -qs "<script>confirm(1)" && echo "$host \033[0;31mJOKER\n" || echo "$host \033[0;32mBATMAN\n" ;
    done | tee "${target}-param"
done < "$wordlist"

