#!/usr/bin/env node --loader ts-node/esm
/**
 * Advent of Code 2025 - Solution Template
 * Replace this with a description of the problem
 */

import { readFileSync } from 'fs';

function solve(): number {
    const data: string = readFileSync('input.txt', 'utf8').trim();
    
    const lines: string[] = data.split('\n');
    
    let result: number = 0;
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
    }
    
    return result;
}

const answer: number = solve();
console.log(answer);  // Last line printed is treated as the answer
