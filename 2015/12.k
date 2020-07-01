/--- Day 12: JSAbacusFramework.io ---

f:{[x;y]
  $[`A`L'@x                          / table or list
      ,/f[;y]'x
    `NA`NI`NL'@x                     / nested something
      $[y&|/"red"~/x[];0;,/f[;y]'x[]]
    `I`i'@x                          / int list or atom
      x
      0]}

+/f[;0b] j:`json?*0:"input/12.txt"
+/f[j;1b]
