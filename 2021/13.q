// --- Day 13: Transparent Origami ---

fs:where""~/:i:read0 `:input/13.txt
c:"J"$","vs'fs#i                                     // coords
f:flip"SJ"$flip"="vs'raze last@'' " "vs''(1+fs) _ i  // folds

fx:{ distinct .[x;(where y < x[;0];0);(2*y)-] }
fy:{ distinct .[x;(where y < x[;1];1);(2*y)-] }

r:{ $[`x=first y;fx;fy]. (x;last y) }\[c;f]
count first r
/763

-1@flip {.[x;y;:;"#"]}/[40 6#" ";] last r;
/
###  #  #  ##  #    ###   ##  ###   ##
#  # #  # #  # #    #  # #  # #  # #  #
#  # #### #  # #    #  # #    #  # #  #
###  #  # #### #    ###  #    ###  ####
# #  #  # #  # #    # #  #  # # #  #  #
#  # #  # #  # #### #  #  ##  #  # #  #
