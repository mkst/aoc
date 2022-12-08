// --- Day 8: Treetop Tree House ---

f: {(x > prev m) and x >= m:maxs x}
g: {{(count 1 _ x) ^ 1 + first where first[x] <= 1 _ x} each (til count x)_\:x}

w: {
  l:x y;
  d:flip x flip y;
  r:reverse each x reverse each y;
  u:flip reverse each x reverse each flip y;
  :(l;d;r;u);
  };

(sum/)(|/)w[f@';] i:"J"$string read0 `:input/08.txt
/ 1711
(max/)(*/)w[g@';i]
/301392
