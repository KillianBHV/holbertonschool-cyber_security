#!/bin/bash
base64_decode=$(echo "$1" | sed -e 's/{xor}//g' | base64 --decode | tr -d \\n | od -An -tx1 | tr -dc '[[:alnum:]]')
size=${#base64_decode}
for (( i=0; i<size; i+=2 )); do
	hexa_xor_underscore=$((16#${base64_decode:i:2} ^ 95))
	result+=$(printf -v hex "%x" "$hexa_xor_underscore" && echo "\x$hex")
done

echo -e $result
