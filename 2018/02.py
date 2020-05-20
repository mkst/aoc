"""--- Day 2: Inventory Management System ---"""

with open("input/02.txt", "r") as f:
    words = f.read().split("\n")[:-1]
    twos = threes = 0
    diff = None
    for word in words:
        two = three = 0
        for letter in set(word):
            c = word.count(letter)
            if c == 2:
                two = 1
            if c == 3:
                three = 1
        twos += two
        threes += three
        if diff is None:
            for wrd in words:
                m = [x != y for x, y in zip(word, wrd)]
                if sum(m) == 1:
                    i = m.index(True)
                    diff = word[:i] + word[i+1:]
                    break
    print(twos * threes)
    # 5658
    print(diff)
    # nmgyjkpruszlbaqwficavxneo
