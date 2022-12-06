// --- Day 6: Tuning Trouble ---

sw:{neg[x-1]_flip next\[x-1;y]}
f:{x + first where {(count distinct x) = count x} each sw[x;y]};

f[4;] i:first read0 `:input/06.txt
/ 1238
f[14;] i
/ 3037
