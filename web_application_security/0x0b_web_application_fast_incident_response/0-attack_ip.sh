#!/bin/bash
grep -E "^([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}" logs.txt | cut -d ' ' -f 1 | sort -i | uniq -c | sort -ir | head -n 1 | sed -E "s/[[:blank:]]+[[:digit:]]+[[:blank:]]+//g"

