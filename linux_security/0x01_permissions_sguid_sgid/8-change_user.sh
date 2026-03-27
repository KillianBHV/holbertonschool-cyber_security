#!/bin/bash
find "$1" -type f -user user2 -exec chmod user3 {} \; -exec ls -l {} \;
