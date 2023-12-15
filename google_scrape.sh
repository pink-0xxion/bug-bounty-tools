#!/bin/bash

# Check if the search query is provided
if [ -z "$1" ]; then
  echo "Please provide a search query as an argument."
  exit 1
fi

# Set the search query from command-line argument
query="$1"

# Set the number of search results to fetch (default: 10)
num_results=10

# Encode the search query for the URL
encoded_query=$(echo "$query" | sed 's/ /%20/g')

# Fetch the search results page
search_url="https://www.google.com/search?q=$encoded_query"
search_page=$(curl -s "$search_url")

# Extract the links using grep
links=$(echo "$search_page" | grep -oP 'https?://[^&"\s]\+')  # or '(?<=href=")\S+(?=")' or 'https?://\S+'

# Save the extracted links in a file
output_file="google_links.txt"
count=1
for link in $links; do
  echo "Link $count: $link"
  echo "$link" >> "$output_file"
  ((count++))
  if ((count > num_results)); then
    break
  fi
done

echo "Output saved in $output_file"



#its not working as google is restricting this scaping tool from working 
#find another way
#use xss google dorks to find the websites
