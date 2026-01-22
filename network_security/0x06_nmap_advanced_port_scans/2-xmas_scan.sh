#!/bin/bash
sudo nmap --open --packet-trace --reason -sX -p 440-450 $1
