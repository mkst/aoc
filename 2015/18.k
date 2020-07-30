/ --- Day 18: Like a GIF For Your Yard ---

g:"#"=0:"input/18.txt" / grid
c:{[x] ,/x,\/x}@!#g    / coords

f:{[x;y] s:+/(`b=@)#.[x;]'y+/(0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1)
    $[.[x;y]
      2 3's
      3=s]}
s:{[x] .[x;2#,0,-1+#x;:;1b]} / set corners

+/,/(100;{[x]  (#x)^f[x]'c})/:g
+/,/(100;{[x] s(#x)^f[x]'c})/:s g
