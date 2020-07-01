/--- Day 6: Probably a Fire Hazard ---

s:{[x] +"ii"$","\'x $[5=#x:" "\x;2 4;1 3]} / sanitise
r:{[x;y] x+!1+y-x}                         / range

f:{[x;y]
  $["n"=y 6
      .[x;;:;1]
    "f"=y 6
      .[x;;:;0]
      .[x;;:;1 0 x . c]] c:r .'s y}
g:{[x;y]
  $["n"=y 6
      .[x;;+;1]
    "f"=y 6
      .[x;;:;0|-1+x . c]
      .[x;;+;2]] c:r .'s y}

+/,/(1000^1000000#0)f/:i:0:"input/06.txt"
+/,/(1000^1000000#0)g/:i
