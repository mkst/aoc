// --- Day 10: The Stars Align ---

t:flip `py`px`vy`vx!flip { {x where not null x}"J"$" "vs inter[x;.Q.n,"- "] } each read0`:input/10.txt
f:{ exec (px+x*vx;py+x*vy) from t }

m:0w
s:-1+(1+)/[{ $[m>=c:count distinct first p:f x;[m::c;1b];0b] };0]

-1@trim r where not all null flip r:./[(g;g:1+max (raze/) msg)#" ";;:;"#"] msg:flip f s;
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
-1"\n",string s;
/10867
