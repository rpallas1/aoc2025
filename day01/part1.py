def solve():
    with open("day01/input.txt") as f:
        data = f.read().strip().splitlines()
    # Example logic — replace this with your real solution
    return sum(int(x) for x in data)


if __name__ == "__main__":
    print(solve())
