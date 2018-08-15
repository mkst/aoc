/ --- Day 20: Infinite Elves and Infinite Houses

d:{ distinct f,x div f:r where 0 = x mod r:1 + til floor sqrt x };
f:{ sum r where (x%y) <= r:d x };

(1+)/[{ x > sum d y }[.1*i:"J"$first read0 `:input/20.txt;];1]
/831600
(1+)/[{ x > f[z;y] }[i%11;50;];1]
/884520
