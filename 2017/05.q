/ --- Day 5: A Maze of Twisty Trampolines, All Alike ---

i:r:"J"$read0 `:input/05.txt
p:c:0; / pointer, counter

while[not null o:i p;
  c+:1;
  i[p]+:1;
  p+:o
 ]
c
/343467

i:r; / reset instructions
p:c:0; / reset pointer, counter

while[not null o:i p;
  c+:1;
  i[p]+:$[2<o;-1;1];
  p+:o
 ]
c
/24774780