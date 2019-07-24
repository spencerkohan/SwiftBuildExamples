#!/bin/bash

# This script builds:
#   1. A library module from World.swift
#   2. An executable module from main.swift, linked with the World module

# Compile the World module
swiftc \
    -c \
    World.swift \
    -parse-as-library

# arguments: 
#   -c : compile only (skip linking)
#   Worfld.swit : input source file
#   -parse-as-library : parse the input as a library

# Produce the .swiftmodule for the World module 
swiftc \
    World.swift \
    -emit-module

# arguments: 
#   Worfld.swit : input source file
#   -emit-module : emit a .swiftmodule file for this source


# Compile the executable
swiftc \
    -c \
    main.swift \
    -I.

# arguments: 
#   -c : compile only (skip linking)
#   main.swit : input source file
#   -I. : add the current directory to the import paths

# Link the object files and produce the executable
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