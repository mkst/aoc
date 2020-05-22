"""--- Day 15: Timing is Everything ---"""

def solve(disks):
    start_time = 0
    while True:
        time = start_time
        valid = True
        for disk in disks:
            time += 1
            if (disk[0] + time) % disk[1] != 0:
                valid = False
                break
        if valid:
            break
        start_time += 1
    return start_time

with open("input/15.txt", "r") as instructions:
    disks = []

    for instruction in instructions:
        _, _, _, positions, _, _, _, _, _, _, _, position = instruction.split()
        disks.append([int(position[:-1]), int(positions)])

    print(solve(disks))
    disks.append([0, 11])
    print(solve(disks))
