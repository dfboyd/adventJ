NB. answer 3, recursive:  a3r
a3r =: 4 : 0
  i =. 0 { x
  NB. recursion level, i.e. which column are we working on
  
  p =. 1 { x
  NB. parity, i.e. 1 = use majority bit, ties = 1,
  NB.              0 = use minority bit, ties = 0

  if. 1 = {. $ y
