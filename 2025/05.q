// --- Day 5: Cafeteria ---

i:{ w:first where 0=count each x;(w#x;(1+w)_x) } read0 `:input/05.txt

r:asc "J"$"-"vs'first i

sum { any x within/:y }[;r] each "J"$last i
/ 615

R:{[x;y]
    current:last x;
    mn: y 0;
    mx: y 1;

    if[mn > current 1;
        // new range
        :(x,enlist y)
        ];

    if[(mn <= current 1) and (mx > current 1);
        // update current range
        :(-1 _ x),enlist (current 0; mx)
        ];

    // else, no change...
    :x
  }/[enlist first r;1 _ r]

sum { 1 + last[x] - first[x] } each R
/ 353716783056994
