#!/bin/bash
# Mason Jennings
# masonj@csu.fullerton.edu

echo "Remove old executable files, if there are any"
rm -f *.out
rm -f *.lis
rm -f *.o

echo "Assemble the x86 file driver.asm"
nasm -f elf64 -o driver.o driver.asm

echo "Assemble the x86 file faraday.asm"
nasm -f elf64 -o faraday.o faraday.asm

echo "Assemble the x86 file strlen.asm"
nasm -f elf64 -o strlen.o strlen.asm

ld -o go.out driver.o faraday.o strlen.o -g

echo "Next, the program will run:
*********************************
"

chmod +x go.out
./go.out