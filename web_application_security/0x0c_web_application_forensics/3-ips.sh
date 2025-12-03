#!/bin/bash
grep "Accepted password for root" auth.log | grep -Po 'from \K[\d.]+' | sort -u | wc -l

