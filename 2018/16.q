// --- Day 16: Chronal Classification ---

AND:{ 0b sv (&). 0b vs'x,y }
OR:{ 0b sv (|). 0b vs'x,y }

opcodes:(!). flip (
  (`addr;{[a;b;c] r[c]:r[a]+r[b] });
  (`addi;{[a;b;c] r[c]:r[a]+b });
  (`mulr;{[a;b;c] r[c]:r[a]*r[b] });
  (`muli;{[a;b;c] r[c]:r[a]*b });
  (`banr;{[a;b;c] r[c]:AND . r[a,b] });
  (`bani;{[a;b;c] r[c]:AND . r[a],b });
  (`borr;{[a;b;c] r[c]:OR . r[a,b] });
  (`bori;{[a;b;c] r[c]:OR . r[a],b });
  (`setr;{[a;b;c] r[c]:r[a] });
  (`seti;{[a;b;c] r[c]:a });
  (`gtir;{[a;b;c] r[c]:0 1 a>r[b] });
  (`gtri;{[a;b;c] r[c]:0 1 r[a]>b });
  (`gtrr;{[a;b;c] r[c]:0 1 r[a]>r[b] });
  (`eqir;{[a;b;c] r[c]:0 1 a=r[b] });
  (`eqri;{[a;b;c] r[c]:0 1 r[a]=b });
  (`eqrr;{[a;b;c] r[c]:0 1 r[a]=r[b] })
  );

i:(0,1+where ""~/:R)cut R:read0 `:input/16.txt
i:(first where 4>count each i)#i
i:{ value each (inter[x 0;.Q.n,","];x 1;inter[x 2;.Q.n,","]) } each i

sum 2<{ sum z~/:{r::x; z . 1_y;r }[x;y;] each opcodes}.'i
/624i

/ create possible opcode map
pos:key[opcodes]!(count opcodes)#enlist til count opcodes
/ clean up possibles
{ pos[e]:pos[e:key[pos] except where z~/:{r::x; z . 1_y;r }[x;y;] each opcodes]except\:first y }.'i;
/ lookup table
lut:()!()
/ assign ids to opcodes
while[count[lut]<count pos;
  oc:first pos p:first where 1=count each pos;
  lut[oc]:p;
  pos:pos except\:oc
 ];
/ arrange opcodes by id
opcodes:opcodes lut til count lut
/ reset registers to zero
r:4#0
/ execute test program
{ opcodes[x 0] . x[1 2 3] } each value each (2 + 4*count i) _ R;
r 0
/ 584
