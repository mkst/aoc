# -- Day 2: 1202 Program Alarm ---

class VM:

    stack = None
    pointer = 0

    def __init__(self, input, id, stdin, stdout):
        self.input = input
        self.id = id
        self.stdin = stdin
        self.stdout = stdout

    def write(self, idx, value):
        self.input[idx] = value

    def init(self):
        self.pointer = 0
        self.stack = [(self.input[:], self.pointer)]

    def run(self):
        while len(self.stack) > 0:
            state, ptr = self.stack.pop()
            op = state[ptr]
            if op in [1, 2]:
                if op == 1:
                    state[state[ptr+3]] = state[state[ptr+1]] + state[state[ptr+2]]
                elif op == 2:
                    state[state[ptr+3]] = state[state[ptr+1]] * state[state[ptr+2]]
                self.stack.insert(0, (state, ptr+4))
            else:
                return state[0]


with open("input/02.txt", "r") as f:
    input = [int(x) for x in f.readlines()[0].strip().split(',')]

    vm = VM(input[:], "a", [], [])
    vm.write(1, 12)
    vm.write(2, 2)
    vm.init()
    r = vm.run()
    print(r)
    # 8017076
    noun, verb = 0, 0

    def lt(x, y):
        if x is None:
            return True
        return x < y

    while lt(vm.run(), 19690720):
        noun += 1
        vm.write(1, noun)
        vm.write(2, verb)
        vm.init()

    noun -= 1

    while vm.run() != 19690720:
        verb += 1
        vm.write(1, noun)
        vm.write(2, verb)
        vm.init()

    print(100*noun + verb)
    # 3146
