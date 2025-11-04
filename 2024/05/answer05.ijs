readfile =: 1!:1
load 'strings'
load 'regex'


r =: 47 53 97 13 97 61 97 47 75 29 61 13 75 53 29 13 97 29 53 29 61 53 97 53 61 29 47 13 75 47 97 75 47 61 75 61 47 29 75 13 53 13

p =: 75 47 61 53 29 ; 97 61 53 29 13 ; 75 29 13 ; 75 97 47 61 53 ; 61 13 29 ; 97 13 75 29 47

p1 =: > 0 { p

check =: 4 : 0
  rules =. x
  pages =. y
  rows =. -: # rules
  nP =. # pages
  indexes =. (rows, 2) $ pages i. rules
  checks =. (-. nP (e."1) indexes) # indexes
  */ </"1 checks
)

middle =: 3 : 0
  n =. <. -: # y
  n { y
)
  

answer1 =: 4 : 0
  rules =. x
  pages =. y
  mask =. (rules & check) each pages
  goodpages =. (> mask) # pages
  middles =. > middle each goodpages
  +/ middles
)

r answer1 p

data =: cutopen (readfile < jcwdpath 'input.txt')

parsedata =: 3 : 0
  NB. data is one box per line
  NB. rules are the lines with '|' in them
  rules =. , ". '| ' charsub > (> '|' e. each y) # y
  pages =. ". each cutopen ', ' charsub > (> ',' e. each y) # y
  NB. pages =: (> ',' e. each y) # y
  rules ; pages
)

parsed_s =: parsedata smi
rs =: > 0 { parsed
ps =: 1 }. parsed

parsed_data =: parsedata data
rules =: > 0 { parsed_data
pages =: 1 }. parsed_data
rules answer1 pages

answer2 =: 4 : 0
  rules =. x
  pages =. y
  mask =. (rules & check) each pages
  badpages =. (-. > mask) # pages
)
