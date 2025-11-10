#!/bin/bash
sudo nmap --packet-trace --reason -sX -p 440-450 $1
