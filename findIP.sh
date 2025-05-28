#!/bin/bash

#ensure provede file name
if [ -z "$1" ]; then
  echo "Usage: $0 <subdomain_list_file>"
  exit 1
fi

input_file="$1"
output_file="iplist.txt"

#input file exists or not
if [ ! -f "$input_file" ]; then
  echo "File '$input_file' not found!"
  exit 1
fi

#Clear the output file before writing
> "$output_file"

echo "[*] Resolving subdomains from $input_file..."

#Loop through each subdomain and resolve the IP
while read -r line; do
  #Remove protocol (http:// or https://)
  subdomain=$(echo "$line" | sed -E 's~https?://~~')

  if [ -n "$subdomain" ]; then
    echo "[+] Resolving: $subdomain"
    ip=$(dig +short "$subdomain" | grep -E '^[0-9.]+' | head -n 1)
    if [ -n "$ip" ]; then
      echo "    -> $ip"
      echo "$ip" >> "$output_file"
    else
      echo "    -> IP not found"
    fi
  fi
done < "$input_file"

echo "Done. All ip saved to $output_file thanks for using this script"

