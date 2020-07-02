/--- Day 5: Doesn't He Have Intern-Elves For This? ---

sw:{[x;y] (y-1)_(-y)#',\x}        / sliding window

v:{[x] 2<#"aeiou"#x}              / 3 vowels
d:{[x] |/=':x}                    / doubles
b:{[x] ~#(2^"abcdpqxy")#sw[;2] x} / no bad chars

p:{[x] $[2=c:#w:&1<+/s~\/s:sw[;2] x;~1=-/|w;2<c]} / non-overlapping pair
r:{[x] |/x=x(!#x)-2}                              / repeat aBa

+/{[x] v[x]&d[x]&b x}'i:0:"input/05.txt"
+/{[x] p[x]&r x}'i
