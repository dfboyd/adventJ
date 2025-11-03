NB. secure container

ans1 =: 4 : 0
  range =: x + i. 1 + y - x
  candidates =: (6 $ 10) #: range
  NB. six digit number, within the range

  deltas =: 2 -~/\"1 candidates

  doubledigits =: 0 (e."1) deltas
  NB. has a double digit: 0 is in the row somewhere

  increasing =: (*/"1) 0 <:"1 deltas
  NB. all elements are nonnegative

  +/ (doubledigits *. increasing)
  NB. count valid values
)
134792 ans1 675810

ans2 =: 4 : 0
  range =: x + i. 1 + y - x
  candidates =: (6 $ 10) #: range
  NB. six digit number, within the range

  deltas =: 2 -~/\"1 candidates

  doubledigits =: 0 (e."1) deltas
  NB. has a double digit: 0 is in the row somewhere

  increasing =: (*/"1) 0 <:"1 deltas
  NB. all elements are nonnegative

  NB. two adjacent matching digits means
  NB. there's at least one _isolated_ 0 in the row

  deltas_bordered =: 1 ,. deltas ,. 1
  2 =/\ deltas_bordered 

  NB. +/ (doubledigits *. increasing)
  NB. count valid values
)
