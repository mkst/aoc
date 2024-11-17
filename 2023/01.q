// --- Day 1: Trebuchet?! ---

f:{ "J"$(first;last)@\:x inter .Q.n }

n:string `one`two`three`four`five`six`seven`eight`nine

g:{ { @[x;last y;:;first string 1 + first y] }/[x;raze w,/:'s w:where 0 < count each s:ss[x;] each n] }

sum f each i:read0 `:input/01.txt
/ 54953

sum f each g each i
/ 53868
