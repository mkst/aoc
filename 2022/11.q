// --- Day 11: Monkey in the Middle ---

inp:{1 _ '(where 0 = count each x) cut x} (enlist ""),read0 `:input/11.txt

p:{[x]
  items:"J"$"," vs 17 _ x[1];
  op:value "{",(ssr[19 _ x[2];"old";"x"]),"}";
  test:"J"$21 _ x[3];
  true:"J"$29 _ x[4];
  false:"J"$30 _ x[5];
  :`items`op`test`true`false!(items;op;test;true;false);
 };

t:update inspected:0 from p each inp

f:{[fn;tab;idx]
  m:tab idx;

  if[0=count m`items;:tab]; // fast exit

  tab[idx;`inspected]+:count m`items;
  tab[idx;`items]:0#0N;

  new:fn m[`op] m`items;
  eq:(new div m`test) = new % m`test;

  tab[m`true;`items],:new where eq;
  tab[m`false;`items],:new where not eq;
  :tab;
 }

t2:{f[x;;]/[y;] til count y}[{x div 3}]/[20;t]
prd 2#desc exec inspected from t2
/117640

modulo:prd exec test from t;
t3:{f[x;;]/[y;] til count y}[{x mod y}[;modulo]]/[10000;t]
prd 2#desc exec inspected from t3
/30616425600
