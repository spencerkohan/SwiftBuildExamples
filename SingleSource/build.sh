#!/bin/bash

# This script produces an executable from the single source file: Hello.swift

# compile the source file to produce an object file
swiftc \
    -c \
    Hello.swift

# arguments:
#   -c : compile only (skip linking)
#   Hello.swift : input source file

# produce an executable
swiftc \
    -emit-executable \
    Hello.o             

# arguments:
#   -emit-executable : emit an executable
#   Hello.o : input object file

# run the executable
./Hello

# Output should be: "Hello world!"