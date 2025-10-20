# Advent of Code 2025

Welcome to our team's **Avent of Code 2025** challenge!
Each day from **December 1st to Decemeber 25th**, a new puzzle will be released at [adventofcode.com/2024](https://adventofcode.com/2024).

This repository is our shared space for:

- Solving and comparing solutions
- Tracking daily progress
- Learning from each other's approaches

Let's have some fun and sharpen our problem-solving skills together!

## Getting Started

### 1. Clone the Repo

```bash
git clone <repo-url>
cd advent-of-code-2025
```

### Step 2: Switch to Starter Branch

```bash
git checkout starter
```

### 3. Create Your Branch

Each person should have their **own branch**

```bash
git checkout -b <yourname>
```

### 4. Copy the Starter Folder

Start Day 1 by running the `newday.sh` script:

```bash
./newday.sh 1
```

This gives you a ready-to-go folder with:

```bash
day01/
├── input.txt
├── sample.txt
├── part1.py
└── part2.py
```

### 5. Solve the Puzzle and Commit

We'll follow a simple workflow:

- Once commit per part per day.
- Keep commits small and meaningful.

Example:

```bash
git add .
git commit -m "Day 01 Part 1 complete"
git push origin <yourname>
```

## Running Your Code

Running your solution has been made as simple as possible.
There are two options: **Python (default)** and **multi-language**.

### Python (defualt)

If your code defines a `solve()` function, just run:

```bash
python3 run.py day01 1
```

This runs `day01/part1.py` and prints the output.

#### Example (`part1.py`):

```python
def solve():
    with open("day01/input.txt") as f:
        data = f.read().strip().splitlines()
    # Example logic — replace with your solution
    return sum(int(x) for x in data)
```

### Node.js

If you'd rather use Node.js, follow the same structure.

```javascript
import fs from "fs";

export function solve() {
  const data = fs
    .readFileSync("day-01/input.txt", "utf-8")
    .trim()
    .split("\n")
    .map(Number);

  return data.reduce((a, b) => a + b, 0);
}

if (import.meta.url === `file://${process.argv[1]}`) {
  console.log(solve());
}
```

Run it with:

```bash
./run.sh day01 1
```

### Bash

Here's a simple Bash example:

```bash
#!/bin/bash/env bash
input="day01/input.txt"

sum=0
while read -r line; do
    ((sum += line))
done < "$input"

echo "$sum"
```

Run it with:

```bash
./run.sh day01 1
```

### Other Languages

If you prefer Javascript or Bash, those are supported too!

```bash
.run.sh day01 1
# or
.run.sh day01 1
```

## Writing Your Solutions

Each python file should define a `solve()` function that returns the answer:

```python
def solve():
    with open("day01/input.txt") as f:
        data = f.read().strip().splitlines()
    # Example logic — replace with your solution
    return sum(int(x) for x in data)

if __name__ == "__main__":
    print(solve())
```

This makes your code consistent with the runner scripts.

## Example Workflow

Here's what a typical day looks like:

```bash
# Day 3 is released!
git switch <yourname>

# Run the new day script
./newday.sh 3

# Solve Part 1
python3 run.py day03 1

# Commit it
git add .
git commit -m "Day 03 Part 1 complete"
git push origin <yourname>

# Solve Part 2
python3 run.py day03 2
git add .
git commit -m "Day 03 Part 2 complete"
git push origin <yourname>
```

## Tips for Success

- Start by creating a solution that works with the sample input.
- Don't worry about optimization until you have a working solution and want to improve it.
