NB. note: their indexing is transposed from J's indexing.

NB. in J, first coord is the row number, from top
NB.       second coord is the column number, from left

NB. in problem, first coord is the column number, from left
NB.             second column is the row number, from top

NB. We're going to swap the input data
NB. and work with it as J coords

readfile =: 1!:1

t =: readfile < jpath '~/Downloads/test-2021-05.txt'

i =: readfile < jpath '~/Downloads/input-2021-05.txt'

load 'strings'

load 'regex'

NB. to write a series of 1s into a matrix of 0s:
NB.   m =: 4 4 $ 0
NB.   1 ( 0 0 ; 1 0 ; 2 0 ) } m

NB.  So let's focus on parsing the input
eliminateLF =: 3 : 0
  ' ' ((LF = y) # (i. # y)) } y
)

amendboard =: 4 : 0
  1 y } (x,x) $ 0
)


answer05a =: 4 : 0
  boardsize =: x
  board =: (x, x) $ 0
  clean_numbers =: (' -> '; ' ' ; ',' ; ' ') stringreplace y
  lines =: +/ LF = y
  d =: (lines, 4) $ ". eliminateLF clean_numbers

  vlines =: ((0 {"1 d) = (2 {"1 d)) # d
  NB. lines where the X coordinate stays the same,
  NB. therefore col 0 == col 2

  hlines =: ((1 {"1 d) = (3 {"1 d)) # d

  h_endpoints =: (/:"1)~ 0 2 {"1 hlines
  NB. endpoints of the horizontal lines, sorted
  
  v_endpoints =: (/:"1)~ 1 3 {"1 vlines

  v_x =: 0{"1 vlines
  NB. x coords of the vertical lines

  h_y =: 1{"1 hlines
  NB. y coords of the horiz lines

  boxed_coordlists =:  h_y ,./~ each i. each 1 + -/ |. |: h_endpoints
  amc =: _2 <\ each , each boxed_coordlists
  NB. amend_coordlists =: ; _2 <\ each , each boxed_coordlists
  +/ > x amendboard each amc
)


10 answer05a t

answer05a2 =: 3 : 0
  clean_numbers =: (' -> '; ' ' ; ',' ; ' ') stringreplace y
  lines =: +/ LF = y
  d_raw =: (lines, 4) $ ". eliminateLF clean_numbers

  N =: 1 + >./ , d_raw

  d =: 1 0 3 2 {"1 d_raw
  NB. transposed, so the coords in each row are y1 x1 y2 x2
  
  amcn =: gchv each _4 <\ , d
  NB. amend_coordinates_with_nulls
  NB. apply gchv to each row of d, producing (boxed) list of boxed coordlists
  NB. some elements of amcn are empty boxes.  Strip them out:
  amc =: (0 < > # each amcn) # amcn

  +/ , 1 < +/ > N amendboard each amc
  NB. calculate final answer
)


answer05b =: 3 : 0
  clean_numbers =: (' -> '; ' ' ; ',' ; ' ') stringreplace y
  lines =: +/ LF = y
  d_raw =: (lines, 4) $ ". eliminateLF clean_numbers

  N =: 1 + >./ , d_raw

  d =: 1 0 3 2 {"1 d_raw
  NB. transposed, so the coords in each row are y1 x1 y2 x2
  
  amcn =: gchvd each _4 <\ , d
  NB. amend_coordinates_with_nulls
  NB. apply gchv to each row of d, producing (boxed) list of boxed coordlists
  NB. some elements of amcn are empty boxes.  Strip them out:
  amc =: (0 < > # each amcn) # amcn

  +/ , 1 < +/ > N amendboard each amc
  NB. calculate final answer
)


NB.  alternate approach:
NB.  generate list of all coordinates in the matrix; match each against the
NB.  lines

gchv =: 3 : 0
  NB. "generate coords horizontal vertical"
  NB.  i.e. generate coords for a line if it's horiz or vert
  NB. given y = a b c d
  NB. figure out if it's a vert or horiz line,
  NB. and generate all the coords on the line

  if. (0 { y) = (2 { y)   NB. y coords equal
  do.
     ly =: 0 { y
     NB. ly is the line's y coord
     'sx ex' =: /:~ 1 3 { y
     cm =: ly ,. sx + i. 1 + ex - sx
     _2 <\, cm
  elseif. (1 { y) = (3 { y)   NB. x coords equal
  do.
     lx =: 1 { y
     'sy ey' =: /:~ 0 2 { y
     cm =: (sy + i. 1 + ey - sy) ,. lx
     _2 <\, cm
  end.
)

gchvd =: 3 : 0
  offset =: - -/ 2 2 $ y
  NB. difference between initial and final coords of the line

  onestep =: * offset
  NB. how many to add for each step

  steps =: >./ | offset
  NB. how many steps to take

  _2 <\ , |: (2 {. y) + onestep */ i. 1 + steps
  
)

answer05a3 =: 3 : 0
  clean_numbers =: (' -> '; ' ' ; ',' ; ' ') stringreplace y
  lines =: +/ LF = y
  d_raw =: (lines, 4) $ ". eliminateLF clean_numbers

  N =: 1 + >./ , d_raw

  d =: 1 0 3 2 {"1 d_raw
  NB. transposed, so the coords in each row are y1 x1 y2 x2
  
  amcn =: gchv2 each _4 <\ , d
  NB. amend_coordinates_with_nulls
  NB. apply gchv to each row of d, producing (boxed) list of boxed coordlists
  NB. some elements of amcn are empty boxes.  Strip them out:
  amc =: (0 < > # each amcn) # amcn

  +/ , 1 < +/ > N amendboard each amc
  NB. calculate final answer
)

gchv2 =: 3 : 0
  ]: offset =: - -/ 2 2 $ y
  if. 0 e. offset
  do.
  onestep =: * offset
  NB. how many to add for each step

  steps =: >./ | offset
  NB. how many steps to take

  _2 <\ , |: (2 {. y) + onestep */ i. 1 + steps
  end.
)


gchv2 0 { d
gchv2 1 { d

iffn =: 3 : 0
  xx =: 2
  if. y < 2
  do.
    3 * y
  end.
)