#!/bin/bash
subfinder -silent -active -oI -d $1 | '{print $0}' > $1.txt
