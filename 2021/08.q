// --- Day 8: Seven Segment Search ---

i:" | " vs/: read0 `:input/08.txt

p1:" "vs'i[;1]
p2:" "vs'i[;0]

sum sum 2 3 4 7=\:raze count@''p1
/284

// via https://code.kx.com/phrases/math/#permutations
c:("abcdefg"!) each {(1 0#x){raze(1 rotate)scan'x,'y}/x}"abcdefg"

// segments
s:("abcefg";"cf";"acdeg";"acdfg";"bcdf";"abdfg";"abdefg";"acf";"abcdefg";"abcdfg")

res:{ last { $[x 0;x;all (asc each y x 1) in s;(1b;y);(0b;x 1)] }/[(0b;x);y] }[; c] each p2

sum { 10 sv s?asc each y x }'[p1;res]
/973499
