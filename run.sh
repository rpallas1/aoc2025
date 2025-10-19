#!/usr/bin/env bash
day=$1
part=$2
ext=${3:-py} # default to Python

if [ -z "$day" ] || [ -z "$part" ]; then
  echo "Usage: ./run.sh <dayXX> <part#> [py|js|sh]"
  exit 1
fi

case $ext in
  py)
    python3 "$day/part$part.py"
    ;;
  js)
    node "$day/part$part.js"
    ;;
  sh)
    bash "$day/part$part.sh"
    ;;
  *)
    echo "Unsupported language: $ext"
    ;;
esac
