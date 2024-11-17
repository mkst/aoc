// --- Day 4: Scratchcards ---

i:{ "J"${ 3 cut x } each  " | " vs 1_ last ":" vs x } each read0 `:input/04.txt

sum { floor 2 xexp -1 + count y inter x }.'i
/ 21919

sum {[x;y] idx:first y; x[idx + 1 + til {count y inter x }. last y] +: x[idx];x }/[count[i]#1;flip (til count i;i)]
/ 9881048
