//--- Day 4: Passport Processing ---

p:{(0,where 0=count each x) _ x} read0 `:input/04.txt
t:raze {[x;y] update id:y from (flip `f`v!"S*"$flip ":"vs'" "vs" "sv x where 0<count each x) }'[;til count p] p

/ mandatory columns
m:`byr`iyr`eyr`hgt`hcl`ecl`pid
/ filter on mandatory columns
count exec distinct id from select from t where f in m, 7 = (count;i) fby id
/ 230

/ pivot
pv:exec m#(f!v) by id:id from t
/ cast columns
pv:update "J"$byr, "J"$iyr, "J"$eyr, `$ecl from pv
/ select
count select from pv
  where byr within 1920 2002, iyr within 2010 2020, eyr within 2020 2030,
  { within["J"$-2_x;] $["cm"~-2#x;150 198;59 76] } each hgt,
  "#"~'first each hcl, ecl in `amb`blu`brn`gry`grn`hzl`oth, 9=count each pid
/156
