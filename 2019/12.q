//--- Day 12: The N-Body Problem ---

f: {
  til[count x]{
    (x[z;0 1 2]+v),v:x[z;3 4 5] + sum
      {
      (0 1 y[0 1 2]>x[0 1 2]) + (0 -1 y[0 1 2]<x[0 1 2])
      }[x z;] each x y _ z
    }[x;]/:til count x
  };

gcd_helper:{$[0=m:mod[x;y];y;.z.s[y;m]]};
gcd:{$[any 0=(x;y);x|y;gcd_helper[x|y;x&y]]};
lcm:{div[x*y;gcd[x;y]]};

a:abs f/[1000;] i:("J"$","vs'(read0 `:input/12.txt) inter\:.Q.n,",-"),\:0 0 0

sum (sum each a[;0 1 2])*sum each a[;3 4 5]
/8454
lcm over raze { 1_ where y[;z]~/:x[;;z] }[f\[250000;i];i;] each (0 3;1 4;2 5)
/362336016722948
