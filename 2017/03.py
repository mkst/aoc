"""--- Day 3: Spiral Memory (Part 2)---"""

def g(x, y):
    return visited[(x, y)] if (x, y) in visited.keys() else 0

def u():
    return g(x, y+1)

def d():
    return g(x, y-1)

def l():
    return g(x-1, y)

def r():
    return g(x+1, y)

def n():
    return (g(x-1, y+1) + g(x, y+1) + g(x+1, y+1) +
            g(x-1, y  )             + g(x+1, y  ) +
            g(x-1, y-1) + g(x, y-1) + g(x+1, y-1))


visited = {}
# bootstrap
visited[(0, 0)] = 1
x = 1
y = 0

i = 0
while i < 368078:
    i = n()            # calculate value for current cell
    visited[(x,y)] = i # update current position

    p = [1*(a > 0) for a in (u(), d(), l(), r())] # next move

    if p in ([1, 0, 1, 0], [1, 0, 0, 0]): # right
        x += 1
    elif p in ([0, 0, 1, 0], [0, 1, 1, 0]): # up
        y += 1
    elif p in ([0, 1, 0, 0], [0, 1, 0, 1]): # left
        x -= 1
    elif p in ([0, 0, 0, 1], [1, 0, 0, 1]): # down
        y -= 1

print(i)
#369601
