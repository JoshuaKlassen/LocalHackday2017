#!/bin/sh

FILE="Main"

./Assemble.sh $FILE.asm

wine ../../bgb/bgb.exe $FILE.gb