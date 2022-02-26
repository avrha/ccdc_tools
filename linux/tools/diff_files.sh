#!/bin/bash

FILE=$1
FILE2=$2
diff "$FILE1" "$FILE2"
cp "$FILE1" "$FILE2"
