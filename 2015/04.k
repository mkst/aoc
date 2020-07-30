/--- Day 4: The Ideal Stocking Stuffer ---

/md5:*"../rs/target/release/libaoc.so"2:`md5!1
md5:*"../c/aoc.so"2:`md5!1

f:{[x;y;z] y<256/3#md5 (x,$z),0x0}[*0:"input/04.txt";;]

(f[16];1+)/:0
(f[0];1+)/:0
