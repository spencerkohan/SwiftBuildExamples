#!/bin/bash

# This script builds a single executable from two source files in the same module

# compile the source files to produce object files
swiftc \
    -c \
    main.swift World.swift \
    -module-name Hello

# arguments: 
#   -c : compile only (skip linking)
#   main.swift World.swift : input source files
#   -module-name Hello : specify the module name as Hello

#link the object files to produce an executalbe
swiftc \
    -emit-executable \
    main.o World.o \
    -o Hello

# arguments: 
#   -emit-executable : emit an executable
#   main.o World.o : input object files
#   -o Hello : specify the output executable path as ./Hello

# run the executable
./Hello

# Output should be: "Hello world!"