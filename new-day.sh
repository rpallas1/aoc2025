#!/usr/bin/env bash

# Advent of Code New Day Setup Script
# Usage: ./new-day.sh <day> [language]
# Example: ./new-day.sh 1 python
# Example: ./new-day.sh 5 js
# Example: ./new-day.sh 10  (defaults to python)

set -e

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_error() {
    echo -e "${RED}Error: $1${NC}" >&2
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${BLUE}$1${NC}"
}

# Setup Python environment with UV
setup_python_env() {
    if [ ! -f "pyproject.toml" ]; then
        print_info "Setting up Python environment with UV..."
        cp templates/pyproject.toml.template pyproject.toml
        echo ""
        print_success "✓ Created pyproject.toml"
        echo ""
        print_info "To install dependencies, run: uv sync"
        print_info "To add a package, run: uv add <package-name>"
        echo ""
    fi
}

# Setup Node.js environment for JavaScript/TypeScript
setup_node_env() {
    if [ ! -f "package.json" ]; then
        print_info "Setting up Node.js environment..."
        cp templates/package.json.template package.json
        cp templates/tsconfig.json.template tsconfig.json
        echo ""
        print_success "✓ Created package.json and tsconfig.json"
        echo ""
        print_info "To install dependencies, run: npm install"
        print_info "To add a package, run: npm install <package-name>"
        echo ""
    fi
}

# Check arguments
if [ $# -lt 1 ]; then
    print_error "Usage: ./new-day.sh <day> [language]"
    echo "Example: ./new-day.sh 1 python"
    echo "Example: ./new-day.sh 5 js"
    echo ""
    echo "Supported languages: python (default), javascript/js, typescript/ts, bash/sh"
    exit 1
fi

DAY=$(printf "%02d" "$1")
LANGUAGE="${2:-python}"

# Normalize language name
case "$LANGUAGE" in
    python|py)
        LANG="python"
        EXT="py"
        TEMPLATE="templates/template.py"
        ;;
    javascript|js)
        LANG="javascript"
        EXT="js"
        TEMPLATE="templates/template.js"
        ;;
    typescript|ts)
        LANG="typescript"
        EXT="ts"
        TEMPLATE="templates/template.ts"
        ;;
    bash|sh)
        LANG="bash"
        EXT="sh"
        TEMPLATE="templates/template.sh"
        ;;
    *)
        print_error "Unsupported language: $LANGUAGE"
        echo "Supported languages: python (default), javascript/js, typescript/ts, bash/sh"
        exit 1
        ;;
esac

DAY_DIR="days/day${DAY}"

# Create days directory if it doesn't exist
if [ ! -d "days" ]; then
    mkdir -p days
fi

# Setup language-specific environment if needed
case "$LANG" in
    python)
        setup_python_env
        ;;
    javascript|typescript)
        setup_node_env
        ;;
    bash)
        # Bash doesn't need any dependency setup
        ;;
esac

# Check if template exists
if [ ! -f "$TEMPLATE" ]; then
    print_error "Template file '$TEMPLATE' does not exist"
    echo "Please ensure templates directory exists with template files"
    exit 1
fi

# Check if day directory already exists
if [ -d "$DAY_DIR" ]; then
    print_error "Directory '$DAY_DIR' already exists"
    echo "Delete it first if you want to recreate it"
    exit 1
fi

# Create day directory
print_info "Creating directory: $DAY_DIR"
mkdir -p "$DAY_DIR"

# Copy template files for part 1 and part 2
print_info "Creating solution files from template..."
cp "$TEMPLATE" "$DAY_DIR/part1.$EXT"
cp "$TEMPLATE" "$DAY_DIR/part2.$EXT"

# Make scripts executable if bash
if [ "$EXT" = "sh" ]; then
    chmod +x "$DAY_DIR/part1.$EXT"
    chmod +x "$DAY_DIR/part2.$EXT"
fi

# Create empty input and sample files
print_info "Creating empty input.txt and sample.txt..."
touch "$DAY_DIR/input.txt"
touch "$DAY_DIR/sample.txt"

# Print success message
echo ""
print_success "✓ Day ${DAY#0} setup complete!"
echo ""
echo "Directory structure:"
echo "  $DAY_DIR/"
echo "    ├── part1.$EXT"
echo "    ├── part2.$EXT"
echo "    ├── input.txt"
echo "    └── sample.txt"
echo ""
echo "Next steps:"
echo "  1. Paste the sample input into $DAY_DIR/sample.txt for testing"
echo "  2. Paste your puzzle input into $DAY_DIR/input.txt"
echo "  3. Implement your solution in $DAY_DIR/part1.$EXT"
echo "  4. Run with: ./run.sh ${DAY#0} 1 $LANG"
echo ""
