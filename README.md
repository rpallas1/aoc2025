# Advent of Code 2025

Welcome to the **Advent of Code 2025** challenge!
Each day from **December 1st to December 12th**, a new puzzle will be released at [adventofcode.com/2025](https://adventofcode.com/2025).

This repository is our shared space for:

- Solving and comparing solutions
- Tracking daily progress
- Learning from each other's approaches

Let's have some fun and sharpen our problem-solving skills together!

## Getting Started

### 1. Clone the Repo

```bash
git clone <repo-url>
cd aoc2025
```

### 2. Create Your Branch

Each person should have their **own branch**

```bash
git checkout -b <firstname>-<lastname>
```

### 3. Push Your Branch

```bash
git push -u origin <firstname>-<lastname>
```

### 4. Create a New Day

Start a new day by running the `new-day.sh` script:

```bash
./new-day.sh 1
```

This creates a ready-to-go folder with:

```bash
days/day01/
├── input.txt      # Your puzzle input goes here
├── sample.txt     # Sample/example input for testing
├── part1.py       # Solution for part 1
└── part2.py       # Solution for part 2
```

**Choose Your Language:**

```bash
./new-day.sh 1           # Python (default)
./new-day.sh 2 js        # JavaScript
./new-day.sh 3 ts        # TypeScript
./new-day.sh 4 bash      # Bash
```

### 5. Solve the Puzzle and Commit

We'll follow a simple workflow:

- One commit per part per day
- Keep commits small and meaningful

Example:

```bash
git add .
git commit -m "Day 01 Part 1 complete"
git push
```

## Running Your Solutions

The universal runner (`run.sh`) handles all languages and provides **automatic execution timing**.

### Basic Usage

```bash
./run.sh <day> <part> [language]
```

Examples:

```bash
./run.sh 1 1 python      # Run day 1, part 1 (Python)
./run.sh 2 2 js          # Run day 2, part 2 (JavaScript)
./run.sh 3 1             # Auto-detect language for day 3, part 1
```

### Auto-Detection

If you don't specify a language, the runner automatically finds and runs your solution:

```bash
./run.sh 1 1    # Finds and runs day01/part1.* automatically
```

## Writing Your Solutions

Solutions read from `input.txt` (or `sample.txt` for testing) and print the answer to stdout.

### Python Example

```python
#!/usr/bin/env python3
"""
Advent of Code 2025 - Day 1 Part 1
"""

def solve():
    # Read input file
    with open('input.txt', 'r') as f:
        data = f.read().strip()

    # Parse input
    lines = data.split('\n')

    # Your solution logic here
    result = sum(int(line) for line in lines)

    return result


if __name__ == '__main__':
    answer = solve()
    print(answer)
```

## Testing with Sample Input

Always test your solution with the sample input first:

1. Copy the sample input from the puzzle into `sample.txt`
2. Temporarily modify your solution to read from `sample.txt` instead of `input.txt`
3. Verify it produces the expected output
4. Switch back to `input.txt` for the real solution

## Example Workflow

Here's what a typical day looks like:

```bash
# Day 3 is released!
git switch <yourname>

# Set up the new day
./new-day.sh 3

# Add sample input for testing
# (Copy from the puzzle page into days/day03/sample.txt)

# Add your actual input
# (Copy from the puzzle page into days/day03/input.txt)

# Implement and test Part 1
./run.sh 3 1

# Commit it
git add .
git commit -m "Day 03 Part 1 complete"
git push

# Implement and test Part 2
./run.sh 3 2

git add .
git commit -m "Day 03 Part 2 complete"
git push
```

## Runner Output

The runner provides a clean output with timing information:

```
╔════════════════════════════════════════╗
║  Advent of Code 2025                   ║
╚════════════════════════════════════════╝

Day:      1
Part:     1
Language: Python
File:     days/day01/part1.py

Running solution...

─────────────────────────────────────────

✓ Solution completed successfully

Answer: 12345

⏱  Execution time: 0.023s
```

## Tips for Success

- Start by testing with the sample input to verify your logic
- Don't worry about optimization until you have a working solution
- Learn from others by checking out their branches after you've solved a day
- Have fun and don't stress if you miss a day!

## Project Structure

```
advent-of-code-2025/
├── run.sh              # Universal runner script
├── new-day.sh          # Day setup script
├── templates/          # Language templates
│   ├── template.py
│   ├── template.js
│   ├── template.ts
│   └── template.sh
├── days/               # Solution folders
│   ├── day01/
│   │   ├── input.txt
│   │   ├── sample.txt
│   │   ├── part1.py
│   │   └── part2.py
│   ├── day02/
│   │   └── ...
│   └── ...
└── README.md
```

## Dependency Management

The project uses modern package managers and automatically sets up dependencies when needed:

### Automatic Setup

When you create your first day with a specific language, the project automatically creates the necessary dependency files:

**Python (UV):**

- Creates `pyproject.toml` on first use
- Install dependencies: `uv sync`
- Add packages: `uv add <package-name>`
- Example: `uv add numpy requests`

**JavaScript/TypeScript:**

- Creates `package.json` and `tsconfig.json` on first use
- Install dependencies: `npm install`
- Add packages: `npm install <package-name>`
- Example: `npm install lodash`

**Bash:**

- No dependency management needed - uses system utilities

## Supported Languages

- **Python** (default) - `python3`
- **JavaScript** - `node`
- **TypeScript** - `ts-node`
- **Bash** - `bash`

Each language has a starter template in the `templates/` directory.

## Adding Your Own Language

Want to use a language that's not currently supported? You can easily extend this template using Cline or any other agentic coding tool.

### Quick Setup with AI

Simply specify which language you want to add and the agent will figure out the details and confirm with you:

**Basic Prompt Template:**

```
Add support for [LANGUAGE_NAME] to my Advent of Code template.

This template organizes solutions in a `days/` folder with scripts that auto-detect and run solutions.

Please:
1. Research [LANGUAGE_NAME] conventions (file extension, execution command, etc.)
2. Create an appropriate solution template that reads from input.txt and prints the answer
3. Update `new-day.sh` and `run.sh` to support this language
4. Update the README documentation
5. Confirm your approach with me before implementing

---

## Optional Configuration (if you have specific requirements)

You can override the AI's inferences by specifying:
- **File Extension**: [e.g., .hs, .rs, .go]
- **Execution Command**: [e.g., runhaskell, cargo run, go run]
- **Common Aliases**: [e.g., haskell, hs]
- **Dependency Manager**: [e.g., cabal, cargo, none]
- **Config Files**: [e.g., Cargo.toml, stack.yaml, none]
```

### Examples

**Simple (let AI figure it out):**

```
Add support for Haskell to my Advent of Code template.

[Rest of starter prompt...]
```

The agent will research Haskell and suggest using `runhaskell`, `.hs` extension, etc.

**With specific requirements:**

```
Add support for Rust to my Advent of Code template.

Use `cargo run` as the execution command and include a Cargo.toml for dependency management.

[Rest of starter prompt...]
```

### Testing Your New Language

After adding support:

1. Test the setup script:

   ```bash
   ./new-day.sh 1 [your-language]
   ```

2. Verify the template was created correctly:

   ```bash
   ls -la days/day01/
   ```

3. Add a simple test to the template and run it:

   ```bash
   ./run.sh 1 1 [your-language]
   ```

4. Verify auto-detection works:
   ```bash
   ./run.sh 1 1
   ```

