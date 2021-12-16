// --- Day 16: Packet Decoder ---

i:raze -4#'0b vs'"0123456789ABCDEF"?first read0`:input/16.txt

pt:(sum/;prd/;min/;max/;::;>/;</;~/)

V:0;

f:{
    tvp:0 3 6 _ x;  // type, version, packet
    x:6 _ x;        // drop header

    V+:2 sv tvp 0; // FIXME

    if[4=t:2 sv tvp 1;
        p:count raze r:{ (1+sum mins first each x)#x:x where 5=count each x } 5 cut x;
        :(p _ x;2 sv raze 1_'r)
        ];

    r:();
    $[first x;
        [
            // 11 bits - number of packets
            np:2 sv 11#1 _ x;
            // drop 11 + 1 bits
            x:11 _ 1 _ x;
            while[0 < np;
                xy:.z.s x;
                r,:last xy;
                x:first xy;
                np-:1
                ]
        ];
        [
            // 15 bits - total length
            tl:2 sv 15#1 _ x;
            // drop 15 + 1 bits
            x:15 _ 1 _ x;
            while[0 < tl;
                cx:count x;
                xy:.z.s x;
                r,:last xy;
                x:first xy;
                tl:tl - cx - count x
                ]
        ]];
    :(x;"j"$pt[t] r)
    }

res:f[i]

V
/1014
last res
/1922490999789
