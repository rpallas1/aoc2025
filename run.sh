#!/usr/bin/env bash

# Advent of Code Solution Runner
# Usage: ./run.sh <day> <part> [language]
# Example: ./run.sh 1 1 python

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_error() {
    echo -e "${RED}Error: $1${NC}" >&2
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${BLUE}$1${NC}"
}

# Check arguments
if [ $# -lt 2 ]; then
    print_error "Usage: ./run.sh <day> <part> [language]"
    echo "Example: ./run.sh 1 1 python"
    echo "Example: ./run.sh 5 2 js"
    exit 1
fi

DAY=$(printf "%02d" "$1")
PART="$2"
LANGUAGE="${3:-}"

DAY_DIR="days/day${DAY}"

# Check if day directory exists
if [ ! -d "$DAY_DIR" ]; then
    print_error "Directory '$DAY_DIR' does not exist"
    echo "Run: ./new-day.sh $1 [language] to create it"
    exit 1
fi

# Function to find solution file
find_solution_file() {
    local part="$1"
    local lang="$2"
    
    # If language is specified, look for that specific file
    if [ -n "$lang" ]; then
        case "$lang" in
            python|py)
                FILE="${DAY_DIR}/part${part}.py"
                ;;
            javascript|js)
                FILE="${DAY_DIR}/part${part}.js"
                ;;
            typescript|ts)
                FILE="${DAY_DIR}/part${part}.ts"
                ;;
            bash|sh)
                FILE="${DAY_DIR}/part${part}.sh"
                ;;
            *)
                print_error "Unsupported language: $lang"
                echo "Supported languages: python, javascript, typescript, bash"
                exit 1
                ;;
        esac
        
        if [ ! -f "$FILE" ]; then
            print_error "File '$FILE' does not exist"
            exit 1
        fi
    else
        # Auto-detect: find any part file
        FILE=$(find "$DAY_DIR" -name "part${part}.*" -type f | head -n 1)
        
        if [ -z "$FILE" ]; then
            print_error "No solution file found for day $DAY, part $part"
            echo "Available files:"
            ls -1 "$DAY_DIR"/ | grep "part${part}\."
            exit 1
        fi
    fi
    
    echo "$FILE"
}

# Find the solution file
SOLUTION_FILE=$(find_solution_file "$PART" "$LANGUAGE")

# Determine language from file extension
EXT="${SOLUTION_FILE##*.}"
case "$EXT" in
    py)
        LANG_NAME="Python"
        RUNNER="python3"
        ;;
    js)
        LANG_NAME="JavaScript"
        RUNNER="node"
        ;;
    ts)
        LANG_NAME="TypeScript"
        RUNNER="ts-node"
        ;;
    sh)
        LANG_NAME="Bash"
        RUNNER="bash"
        ;;
    *)
        LANG_NAME="Unknown"
        RUNNER=""
        ;;
esac

# Check if runner is available
if ! command -v ${RUNNER%% *} &> /dev/null; then
    print_error "${RUNNER%% *} is not installed or not in PATH"
    exit 1
fi

# Print header
echo ""
print_info "╔════════════════════════════════════════╗"
print_info "║  Advent of Code 2025                   ║"
print_info "╚════════════════════════════════════════╝"
echo ""
echo -e "${BLUE}Day:${NC}      ${DAY#0}"
echo -e "${BLUE}Part:${NC}     ${PART}"
echo -e "${BLUE}Language:${NC} ${LANG_NAME}"
echo -e "${BLUE}File:${NC}     ${SOLUTION_FILE}"
echo ""
print_info "Running solution..."
echo ""

# Change to day directory so solutions can find input.txt
cd "$DAY_DIR"

# Run the solution and capture output and timing
START_TIME=$(date +%s%N)
OUTPUT=$($RUNNER "../$SOLUTION_FILE" 2>&1)
EXIT_CODE=$?
END_TIME=$(date +%s%N)

# Calculate elapsed time in seconds
ELAPSED_NS=$((END_TIME - START_TIME))
ELAPSED_S=$(echo "scale=3; $ELAPSED_NS / 1000000000" | bc)

# Extract the last non-empty line as the answer
ANSWER=$(echo "$OUTPUT" | grep -v '^[[:space:]]*$' | tail -n 1)

# Print results
echo "─────────────────────────────────────────"
echo ""

if [ $EXIT_CODE -eq 0 ]; then
    print_success "✓ Solution completed successfully"
    echo ""
    
    # Show all output if there's more than just the answer
    if [ "$(echo "$OUTPUT" | grep -v '^[[:space:]]*$' | wc -l)" -gt 1 ]; then
        echo -e "${BLUE}Debug Output:${NC}"
        echo "$OUTPUT" | sed '$d'
        echo ""
    fi
    
    echo -e "${GREEN}Answer:${NC} ${ANSWER}"
else
    print_error "✗ Solution failed with exit code $EXIT_CODE"
    echo ""
    echo -e "${RED}Output:${NC}"
    echo "$OUTPUT"
fi

echo ""
echo -e "${YELLOW}⏱  Execution time: ${ELAPSED_S}s${NC}"
echo ""

exit $EXIT_CODE
