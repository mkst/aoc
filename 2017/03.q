/--- Day 3: Spiral Memory ---

/A016754
dist:{ last {(1+f;last[x],(1+2*f)*(1+2*f:first x))}/[{[x;y]last last y < x}[x;];(1;enlist 1)] }
/distance from bottom right corner
fbrc:{ $[x=last c:dist x;0;x-last -1_c] }

{(2*-1+count dist x)-mod[fbrc x;floor sqrt x]} 368078 / FIXME: doesnt work for all examples (left/right of midpoint?)
/371

/bootstrap
v:enlist[0 0]!enlist[1];
x:1;y:0;

/iterate
while[368078>n:sum 0^v[(x-1),y+1],v[1+x,y],v[-1+x,y],v[(x+1),y-1],p:v[x,y+1],v[x,y-1],v[(x-1),y],v[(x+1),y];
  v[x,y]:n;
  $[any (p:not not 0^p)~/:(1010b;1000b);
    x+:1;                      / right
    any p~/:(0010b;0110b);
      y+:1;                    / up
      any p~/:(0100b;0101b);
        x-:1;                  / left
        any p~/:(0001b;1001b);
          y-:1;                / down
          '"unknown"];
  ]

n
/369601