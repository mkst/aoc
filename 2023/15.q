// --- Day 15: Lens Library ---

hash:{[x;y] (17 * (x + "i"$y)) mod 256 }

sum { hash/[0;x] } each "," vs first read0 `:input/15.txt
/510273
