/--- Day 24: Electromagnetic Moat ---

bridge:{
  w:y~\:2#-1#x;
  res:.z.s'[x,/:y where w;y _/:where w],
      .z.s'[x,/:y where a;y _/:where a:not[w] and (last last x)=y[;0]],
      .z.s'[x,/:reverse each y where a;y _/:where a:not[w] and (last last x)=y[;1]];
  $[count res;res;x]
  };

flat:{ (raze .z.s each x where t),x where not t:0h=type each x };

max sum each res:flat bridge[0;] "J"$"/"vs'read0 `:input/24.txt
/1940
max sum each res where c=max c:count each res
/1928