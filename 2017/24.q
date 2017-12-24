/--- Day 24: Electromagnetic Moat ---

l:0; / max length

bridge:{
  w:y~\:2#-1#x;
  res:({bridge[x;y _ first where y~\:-2#x]}[;y] each x,/:y where w),
      ({bridge[x;y _ first where y~\:-2#x]}[;y] each x,/:y where not[w] and y[;0]=last last x),
      ({bridge[x;y _ first where y~\:reverse -2#x]}[;y] each x,/:reverse each y where not[w] and y[;1]=last last x);
  $[count res;res;[if[l<=c:count x;l::c];x]]
  };

flat:{ (raze .z.s each x where t),x where not t:0h=type each x };

max sum each res:f:flat bridge[0;] asc "J"$"/"vs'read0 `:input/24a.txt
/1940
max sum each res where l=count each res
/1928