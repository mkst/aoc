// --- Day 5: Alchemical Reduction ---

fold:{ x(_)/-1 -1+first where 32 = abs deltas x }

count fold/[j:"j"$r:first read0 `:input/05.txt]
/ 9370
min { count fold/[x] } each j except/:-32 0+/:"j"$distinct lower r
/ 6390

\
k)fold:{x_/-1 -1+*&32=abs@-':x}
k)(#fold/j),&/{#fold/x}@'{x@&~x in y}[(j:"j"$r);]@/:-32 0+/:"j"$?_r:*0:`:input/05.txt
