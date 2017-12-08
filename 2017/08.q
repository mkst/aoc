/ --- Day 8: I Heard You Like Registers ---

i:flip R:("*** ***";" ") 0: read0 `:input/08.txt;

r:set[;0] each `$distinct R 0; / initialise registers to zero
i[;1]:("+:";"-:")"dec"~/:R 1;  / replace "inc/dec" with "+:/-:"

res:{
  value raze "if[",x[3],$["=="~e:x 4;"=";"!="~e;"<>";e],x[5],";",x[0 1 2],"]";
  max value each r
  } each i;

last res
/4902
max res
/7037