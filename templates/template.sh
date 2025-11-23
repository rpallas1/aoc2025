#!/usr/bin/env bash

# Advent of Code 2025 - Solution Template
# Replace this with a description of the problem

solve() {
    local data=$(cat input.txt)
    
    local result=0
    local line_num=0
    
    while IFS= read -r line; do
        :
        
        ((line_num++))
    done < input.txt
    
    echo "$result"
}

answer=$(solve)
echo "$answer"  # Last line printed is treated as the answer
