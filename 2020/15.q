//--- Day 15: Rambunctious Recitation ---

f:{[x]
   x,$[0=sum e:x=last x;
     0;
     (-). reverse 1+-2#where e
     ]
  };

i:"J"$","vs first read0 `:input/15.txt

last f/[2020-count i;i]
/ 257


g:{[xy]
   x:first xy;
   y:last xy;
   // update dictionary
   d[i:$[1=count d x;0;(-). reverse -2#d x]],:y;
   // return (last;turn)
   (i;y+1)
  };

d:(`u#i)!enlist each 1+til count i
first g/[30000000-count i;(last i;1+count i)]
/8546398
