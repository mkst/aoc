// --- Day 10: The Stars Align ---

t:flip `py`px`vy`vx!flip { raze "J"$-1_last each ","vs''"<"vs/:">"vs x} each read0`:input/10.txt
f:{ exec (px+x*vx;py+x*vy) from t }

m:0w;
sec:-1+(1+)/[{ $[any 0>raze p:f x;1b;m>=c:count group first p;[m::c;1b];0b] };0]

-1@trim r where not all null flip r:./[(1+max first flip msg;1+max last flip msg)#" ";;:;"#"] msg:flip f sec;
/######  #####   ######  #    #  #          ###  ######   ####
/#       #    #       #  #   #   #           #        #  #    #
/#       #    #       #  #  #    #           #        #  #
/#       #    #      #   # #     #           #       #   #
/#####   #####      #    ##      #           #      #    #
/#       #         #     ##      #           #     #     #  ###
/#       #        #      # #     #           #    #      #    #
/#       #       #       #  #    #       #   #   #       #    #
/#       #       #       #   #   #       #   #   #       #   ##
/#       #       ######  #    #  ######   ###    ######   ### #
-1"\n",string sec;
/10867
