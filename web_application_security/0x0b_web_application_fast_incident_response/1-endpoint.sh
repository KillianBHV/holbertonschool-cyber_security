#!/bin/bash
grep -Eo "(GET|POST).*" logs.txt | sed -E "s/(GET|POST)[[:blank:]]+//g" | sed -E "s/[[:blank:]].*//g" | sort -i | uniq -c | sort -ir | head -n 1 | sed -E "s/[[:blank:]]+[[:digit:]]+[[:blank:]]+//g" 

