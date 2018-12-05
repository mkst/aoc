// --- Day 5: Alchemical Reduction ---

fold:{ $[32=abs y-last x;-1_(),x;x,y] }

count j:fold/["j"$r:first read0 `:input/05.txt]
/ 9370
min { count fold/[x] } each j except/:-32 0+/:"j"$distinct lower r
/ 6390

\
k)fold:{$[32=abs y-last x;-1_(),x;x,y]}
k)|(&/{#fold/x}@'{x@&~x in y}[j;]':-32 0+/:"j"$?_r),#j:fold/"j"$r:*0:`:input/05.txt
