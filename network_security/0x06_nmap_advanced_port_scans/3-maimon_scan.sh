#!/bin/bash
sudo nmap -sM -v -p ftp,ssh,telnet,http* $1
