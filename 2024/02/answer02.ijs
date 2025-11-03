readfile =: 1!:1
load 'strings'

sample =: 6 5 $ 7 6 4 2 1 1 2 7 8 9 9 7 6 2 1 1 3 2 4 5 8 6 4 4 1 1 3 6 7 9

NB. We want the difference between adjacent pairs of elements.

NB. We use "behead" `}.` and "curtail" `}:` with `"1` to remove the
NB. initial column and the final column, and then subtract.

NB. differences between adjacent elements
testdata =: <"1 sample

# a function to test each row
testfn =: 3 : 0
  differences =: (}. - }:) y
  monotonic =: (*./ differences > 0) +. (*./ differences < 0)
  clamped =: *./ 4 > | differences
  monotonic *. clamped
)

answer01 =: 3 : 0
  +/ > testfn each y
)

answer01 testdata
NB. should be 2

data =: ". each cutopen (readfile < jcwdpath 'input.txt')

answer01 data

testfn2 =: 3 : 0
  NI =: -. =/~ i. # y
  NB. NI: not-identity matrix
  
  y_minus =: <"1 NI # y
  NB. rows are copies of y with one element removed in order

  +./ > testfn each y_minus
)

answer02 =: 3 : 0
  +/ > testfn2 each y
)

answer02 testdata
NB. should be 4

answer02 data
