/--- Day 7: Some Assembly Required ---

g:{[x] $["0123456789"'*x;. x;(!W)'`$x;W`$x;()]} / get
b:{[x] ((32-#b)#0),b:2\x}                       / binary

w:{[x;y] $[#(),v:g@x;W[`$y]:v;()]}              / wire
n:{[x;y] $[#(),v:g@x;W[`$y]:2/16 _1 0 b v;()]}  / not
a:{[x;y;z] $[2=#,/v:g'(x;y);W[`$z]:2/&/b'v;()]} / and
o:{[x;y;z] $[2=#,/v:g'(x;y);W[`$z]:2/|/b'v;()]} / or
l:{[x;y;z] $[2=#,/v:g'(x;y);W[`$z]:{[x;y] 2/16 _ b[x],y#0}. v;()]} / lshift
r:{[x;y;z] $[2=#,/v:g'(x;y);W[`$z]:{[x;y] 2/(-y) _ b x}. v;()]}    / rshift

f:{[x]
  $[(!W)'`$last x                               / already solved
      ()
    3=#x                                        / wire
      w . x 0 2
    4=#x                                        / not
      n . x 1 3
      ((a;o;l;r)"AOLR"?x[1;0]). x 0 2 4]}

W:`!0N / Wires
{[x;y] f'x;W}[i:" "\'0:"input/07.txt"]/:0;
A:W`a;A

W:`!0N
i:@[i;&(,"b")~/last'i;:;,($A;"->";,"b")]
{[x;y] f'x;W}[i]/:0;
*W`a
