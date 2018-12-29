/--- Day 5: How About a Nice Game of Chess? ---

p:first read0 `:input/05.txt
pw:8#" ";

r:(
    (1+)/[{ 16<256 sv 3#"j"$md5 p,string x };]1+
  )\[
    {
      m:raze string 4#md5 p,string x;
      if[(x>0)&(null pw[i:"J"$m 5])&m[5]in"01234567";
        pw[i]:m 6
        ];
      any null pw
    };-1]

(raze each string md5@'p,/:string 1_r)[til 8;5]
/c6697b55
pw
/8c35d1ab
