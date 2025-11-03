passes =: 0 : 0
FBFBBFFRLR
BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
)

p =. ((11 %~ # passes), 10) $ (-. LF = passes) # passes

#. +./ 'BR' =/ p


>./ #. +./ 'BR' =/ p

readfile =: 1!:1

passes =: readfile < jpath '~/Downloads/2020-5.txt'

spl =. /:~ #. +./ 'BR' =/ p

mn =: 0 { spl

mx =: _1 { spl - mn

