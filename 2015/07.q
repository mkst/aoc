/--- Day 7: Some Assembly Required ---

.a.wires:(`u#enlist `)!enlist 0N

.a.get:{ $[all x in .Q.n;"J"$x;.a.wires `$x] }
.a.not:{ $[null r:.a.get x;0N;0b sv (48#0b),not -16#0b vs r] }
.a.and:{ $[any null r:.a.get each (x;y);0N;0b sv all 0b vs'r] }
.a.or:{ $[any null r:.a.get each (x;y);0N;0b sv any 0b vs'r] }
.a.ls:{ "j"$(2 xexp .a.get y) * .a.get x }
.a.rs:{ .a.get[x] div (2 xexp .a.get y) }

f:{
  if[not null .a.wires y;:()];
  .a.wires[y]:$[1=count x;
    .a.get x 0;
    "NOT"~x 0;
    .a.not x 1;
    "AND"~x 1;
    .a.and . x 0 2;
    "OR"~x 1;
    .a.or . x 0 2;
    "LSHIFT"~x 1;
    .a.ls . x 0 2;
    .a.rs . x 0 2
    ]
  };

i:{(" "vs x;`$y)}.'" -> "vs/:read0 `:input/07.txt

while[null .a.wires`a;f .'i];a:.a.wires`a;a
/16076

delete from `.a.wires;
i[where i[;1]=`b;0]:enlist enlist string a
while[null .a.wires`a;f .'i];a:.a.wires`a;a
/2797
