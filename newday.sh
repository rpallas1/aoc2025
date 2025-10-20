#!/usr/bin/env bash
# Advent of Code Day Folder Creator
# Usage: ./newday.sh <day_number>

set -e

if [ -z "$1" ]; then
  echo "Usage: ./newday.sh <day_number>"
  exit 1
fi

# Pad single-digit days with a leading zero (e.g., 3 -> day03)
day_num=$(printf "%02d" "$1")
day_dir="day${day_num}"

if [ -d "$day_dir" ]; then
  echo "⚠️  $day_dir already exists. Nothing created."
  exit 0
fi

mkdir -p "$day_dir"

# TODO: Take a language argument and create files accordingly (python, js, bash, etc.)

# Create files
cat > "$day_dir/part1.py" << EOF
def solve():
    with open("${day_dir}/input.txt") as f:
        # TODO: implement solution
    return None

if __name__ == "__main__":
    print(solve())
EOF

cat > "$day_dir/part2.py" << EOF
def solve():
    with open("${day_dir}/input.txt") as f:
        # TODO: implement solution
    return None

if __name__ == "__main__":
    print(solve())
EOF

touch "$day_dir/input.txt"
touch "$day_dir/sample.txt"

echo "📁 Created $day_dir/"
echo "✅ Created part1.py"
echo "✅ Created part2.py"
echo "✅ Created input.txt"
echo "✅ Created sample.txt"
echo
echo "🎄 Day ${day_num} setup complete! Ready to code!"
