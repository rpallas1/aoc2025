#!/usr/bin/env node
/**
 * Advent of Code 2025 - Solution Template
 * Replace this with a description of the problem
 */

import { readFileSync } from 'fs';

function solve() {
    const data = readFileSync('input.txt', 'utf8').trim();
    
    const lines = data.split('\n');
    
    let result = 0;
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
    }
    
    return result;
}

const answer = solve();
console.log(answer);  // Last line printed is treated as the answer
