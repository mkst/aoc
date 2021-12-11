// --- Day 11: Dumbo Octopus ---

i:.Q.n?read0 `:input/11.txt

s:(-1 0;-1 1;0 1;1 1;1 0;1 -1;0 -1;-1 -1)

f:{
    fo:raze { (til count x),/:'where each x } 9<o:first x; // flashing octos
    fo:fo except pf:last x;                                // skip previously flashed octos
    so:raze fo+\:/:s;                                      // determine surrounding octopi
    so:so where all each (so > -1) and so < count o;       // filter to confines of grid
    o:{ .[x;y;+;1] }/[o;so];                               // update octos
    (o;pf,fo)
  }

g:{
    octo:x 0;
    flash:x 1;
    step:1+x 2;
    // perform step
    octo:first f/[(octo+1;enlist 0N 0N)];
    // anything above 9 is a flashed octo, if all flashed return
    if[(count raze octo)=nf:sum raze 9 < octo;:step];
    // reset to zero
    octo:{ @[x;where 9<x;:;0] } each octo;
    (octo;flash+nf;step)
 }

@[;1] g/[100;(i;0;0)]
/1546
last g/[{3=count x};(i;0;0)]
/471
