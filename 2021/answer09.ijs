readfile =: 1!:1
load 'strings'
load 'regex'
load 'text'
eliminatecommas =: 3 : 0
   ' ' ((',' = y) # (i. # y)) } y
)

eliminateLF =: 3 : 0
   ' ' ((LF = y) # (i. # y)) } y
)

t =: 5 10 $ 2 1 9 9 9 4 3 2 1 0 3 9 8 7 8 9 4 9 2 1 9 8 5 6 7 8 9 8 9 2 8 7 6 7 8 9 6 7 8 9 9 8 9 9 9 6 5 6 7 8 


lr =: 3 :  '(_1 1) (|.!._"0 1)/ y'
ud =: 3 :  '(_1 1) (|.!._"0 2)/ y'

xlr =: 4 :  '(_1 1) (|.!.x"0 1)/ y'
xud =: 4 :  '(_1 1) (|.!.x"0 2)/ y'

udlr =: 4 : 'x (xud , xlr) y'

(*./ t <"2 (ud , lr) t)

ans1 =: 3 : '+/ 1 + (, *./ y <"2 (ud , lr) y) # , y'

it =: readfile < jpath '~/Downloads/input-2021-09.txt'

i =: 100 100 $ ". eliminateLF , it ,. ' '
NB.  basins =:  -. m = 9  yields a boolean matrix,
NB.  where contiguous groups of 1s are basins.
NB.  find the low points boolean matrix
NB.  for each 1 in it:
NB.    turn off all the 1s in basins that don't touch the 1
NB.


prop =: 4 : 0
  y +. x *. +./ 0 udlr y
)
mm =: t < 9
nn =: 1 (< 2 3 ) } 5 10 $ 0

NB. lowpoint_indexes =: (, lowpoints_boolean_matrix) # i. 50
NB. (<. lowpoint_index

propxy =: 4 : 0
   NB.  x: mm 1s where it's a basin
   NB.  y: startpoint coords - boxed
   sp =: 1 ((< y) }) ($ x) $ 0
   NB. generate conforming zeros matrix with startpoint set to 1

   NB. propagate from startpoint, and sum to get the size of the basin
   mmm =: x prop^:_ sp
   +/ , mmm
)

ans2 =: 3 : 0
  N =: */ $ y
  sz =: $ y
  lowpoints_boolean =: *./ y (<"2) _ udlr y
  lpyx =: <"1 ($ y) #: (, lowpoints_boolean) # i. N
  NB.  yx coords of lowpoints, boxed
  basins_boolean =: y < 9
  bsizes =: > (basins_boolean & propxy) each lpyx
  */ 3 {. \:~ bsizes
)
ans2 t
