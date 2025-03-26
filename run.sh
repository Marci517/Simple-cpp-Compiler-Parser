#!/bin/bash

flex flexFile.l
bison -dv bisonFile.y
g++ lex.yy.c bisonFile.tab.c

./a.out < input.txt