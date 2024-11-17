// --- Day 3: Gear Ratios ---

i:read0 `:input/03.txt

f:{[grid;x;pos]
    xx:last x;
    gear:xx[0];
    symb:xx[1];
    cood:xx[2];

    // new gear or still in current gear
    c:grid . pos;
    if[c in .Q.n;
        gear,:c;
        s:grid ./:p:pos+/:(1 0; 1 1; 0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1);
        symb,:s except .Q.n," .";
        cood:distinct cood,p where "*"=s;
        :(-1 _ x),enlist (gear;symb;cood)
        ];

    // finished current gear, add new empty entry
    if[count gear;
        :x, enlist ()
        ];

    // no current gear, just continue
    :x;
  }[i;;]

t: flip `gear`val`typ!"J**"$flip -1 _ f/[(); ] { til[x] cross til x } count i
exec sum gear from t where 0 < count each val
/519444

sum exec prd gear by typ from t where 2 = (count;typ) fby typ
/74528807
