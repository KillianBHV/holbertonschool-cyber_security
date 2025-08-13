#!/bin/bash
subfinder -silent -active -oI -d $1 | awk -F',' '{print $1","$2}' > $1.txt
