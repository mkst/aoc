# --- Day 1: Not Quite Lisp ---

input = "input/01.txt"

a = cumsum( c( -1, 1 )[ 1 + as.integer( "(" == strsplit( readChar( input, file.info( input )$size ), "" )[[ 1 ]] ) ] )
tail(a, n = 1 )
#[1] 232

min( which( a == -1 ) )
#[1] 1783
