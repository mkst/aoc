/--- Day 24: Electromagnetic Moat ---

f:{[bridge;options]
  w1:where options[;0]=lc:last bridge; / options that match
  w2:except[;w1] where options[;1]=lc; / options that match in reverse
  if[0=count w1,w2;:enlist bridge];    / return if no further options

  raze .z.s'[bridge,/:(options w1),reverse each options w2;options _/:w1,w2]
 }

max sum each res:f[0;] "J"$"/"vs'read0 `:input/24.txt
/1940
max sum each res where c=max c:count each res
/1928
