#--- Day 1: Inverse Captcha ---

with open ("input/01.txt") as f:
    data = f.readline()[:-1] # drop newline
    print sum([int(x) for x,y in zip(data, data[1:]+data[0]) if x == y])
    #1047
    print 2*sum([int(x) for x,y in zip(data[:int(.5*len(data))], data[int(.5*len(data)):]) if x == y])
    #892