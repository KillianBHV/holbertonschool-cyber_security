#!/bin/bash
whois -H $1 | awk '$1 ~ /Registrant|Admin|Tech/ {print $0}' > $1.csv
