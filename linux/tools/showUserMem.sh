#!/bin/bash
ps -U $1 --format %mem | awk '{memory +=$1}; END {print memory }'
