#!/bin/bash
grep "new user" auth.log | grep -Po 'name=\K[^,]+' | sort -u | paste -sd,

