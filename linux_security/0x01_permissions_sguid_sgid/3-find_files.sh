#!/bin/bash
find $1 -4000 -perm -exec ls -l {} \; 2> /dev/null
