"""--- Day 18: Like a Rogue ---"""

def solve(line, max_rows):
    safes = sum([1 for x in line if x == "."])

    for _ in range(max_rows - 1):
        out = "^" if line[1] == "^" else "."
        for i in range(1, len(instruction) - 1):
            lcr = line[i-1:i+2]
            if lcr in ["^^.", ".^^", "^..", "..^"]:
                out += "^"
            else:
                out += "."
        out += "^" if line[-2] == "^" else "."
        safes += sum([1 for x in out if x == "."])
        line = out

    return safes

with open("input/18.txt", "r") as f:
    instruction = f.read()[:-1]
    print(solve(instruction, 40))
    print(solve(instruction, 400000))
