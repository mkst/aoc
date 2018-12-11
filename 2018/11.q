// --- Day 11: Chronal Charge ---

sn:"J"$first read0 `:input/11.txt
g:300
/ apply power to grid
grid:(2#g)#{ mod[div[(x+11)*sn+(1+y)*x+11;100];10]-5 }.'raze til[g],\:/:til g;
/ determine max and coords of max
f:{ (max r;1+(mod[;1+g-x];div[;1+g-x])@\:r?max r:{ sum raze .[grid;x] } each (x cut) each raze a,/:\:a:til[1+g-x]+\:til x) }
/ solve for sliding window of size 3
-1@","sv string last f 3;
/ "20,62"
-1@{ (","sv string last x),",",string 2 + y }[;w] res w:res[;0]?max (res:f peach 2 + til 18)[;0];
/ "229,61,16"
