/--- Day 8: Two-Factor Authentication ---

l:50 6#0

{
  if[2=count x;
    .[`l;;:;1] til each "J"$"x"vs last x
    ];
  if[5=count x;
    a:"J"$last "=" vs x 2;
    b:neg"J"$last x;
    $["x"=x[2;0];
      [
        f[;a]:b rotate (f:flip l)[;a];
        l::flip f
      ];
        l[;a]:b rotate l[;a]
      ];
    ];
 } each " "vs'read0 `:input/08.txt;

sum raze l
/110
-1" #"flip l;
/####   ## #  # ###  #  #  ##  ###  #    #   #  ##
/   #    # #  # #  # # #  #  # #  # #    #   #   #
/  #     # #### #  # ##   #    #  # #     # #    #
/ #      # #  # ###  # #  #    ###  #      #     #
/#    #  # #  # # #  # #  #  # #    #      #  #  #
/####  ##  #  # #  # #  #  ##  #    ####   #   ##
