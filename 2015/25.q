/ --- Day 25: Let It Snow ---

i:"J"$","vs 1_inter[;.Q.n,","]first read0 `:input/25.txt;
R:i 0
C:i 1

r:last 1+sums til R

/ calculate number for RxC
n:{ last x + sums 0,(y+1) + til z-1 }[r;R;C]

/ off-by-1
(mod[;33554393]252533*)/[n-1;20151125]
/2650453
