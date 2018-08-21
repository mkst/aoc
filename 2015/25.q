/ --- Day 25: Let It Snow ---

i:"J"$","vs 1_inter[;.Q.n,","]first read0 `:input/25.txt;
R:i 0
C:i 1

/ calculate row value
r:1 + sum til R

/ calculate value at RxC
n:{ x + sum y + 1 + til z - 1 }[r;R;C]

/ iterate to n-1
(mod[;33554393]252533*)/[n-1;20151125]
/2650453
