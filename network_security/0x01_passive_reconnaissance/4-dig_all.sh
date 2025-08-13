#!/bin/bash
# WARNING ! The "any" option of the "dig" command could fail in most cases
# SEE RFC8482 to learn about the decisions to reject any requests
#
# ALTERNATIVE METHOD! REQUEST EACH RECORD TYPE
for type in A AAAA CNAME NS SOA MX PTR SRV TXT
do
	dig +noall +answer $1 $type
done
