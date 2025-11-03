readfile =: 1!:1

load 'strings'

load 'regex'

load 'text'


t =: 16 1 2 0 4 2 7 1 2 14

t -/ (i. 17) 

<. / +/ | t -/ (i. 17) 

i =: readfile < jpath '~/Downloads/input-2021-07.txt'

eliminatecommas =: 3 : 0
  ' ' ((',' = y) # (i. # y)) } y
)

eliminateLF =: 3 : 0
  ' ' ((LF = y) # (i. # y)) } y
)

it =: eliminateLF eliminatecommas i


<. / +/ | itn -/ i. 1 + >./ itn

m =: | t -/ (i. 17) 

input =: readfile < jpath '~/Downloads/input-2021-07.txt'
i =: ". (', ', LF, ' ') charsub input
m =: | i -/ i. 1 + >./ i
a1 =: <. / +/ m
a2 =: <. / +/ 2 %~ m * m + 1x

NB. 2019 day 1

i1 =: readfile < jpath '~/Downloads/input-2019-01.txt'

ii =: ". (LF, ' ') charsub i1

oa1 =: 3 : 0
  +/ _2 + <. 3x %~ y
)

+/ oa1 ii

step =: 3 : 0
  0 >. _2 + <. 3x %~ y
)

+/ +/ 1 }. step^:a: ii

NB. 2019 day 2

step =: 3 : 0
  mem =: y
  pc =: 0
  while. 99 ~: pc { mem
  do.
    select. pc { mem
    case. 1
      do.
	  a =: mem {~ mem {~ pc + 1
	  b =: mem {~ mem {~ pc + 2
	  o =: mem {~ pc + 3
	  mem =: (a + b) o } mem
          pc =: pc + 4
    case. 2
      do. 
	  a =: mem {~ mem {~ pc + 1
	  b =: mem {~ mem {~ pc + 2
	  o =: mem {~ pc + 3
	  mem =: (a * b) o } mem
          pc =: pc + 4
    end.
  end.
  mem
)
step 1 0 0 0 99

it =: readfile < jpath '~/Downloads/input-2019-02.txt'
i =: ". (', ', LF, ' ') charsub it

j1 =: readfile < jpath '~/Downloads/input-2018-01.txt'

jj1 =: ('+ -_', LF, ' ') charsub j1

a2 =: 3 : 0
  NB. y is the sequence
  n =: # y
  freq =: 0
  i =: 0
  freqset =: 0 $ 0
  whilst. -. freq e. freqset
  do.
    freqset =: freqset , freq
    freq =: freq + (n | i) { y
    i =: i + 1
  end.
  freq return.
)

NB. new idea:
NB.  1. make one trip through 1, making a list of all freqs hit.
NB.     If any dupes during that one trip, we're done.
NB.  2. if we're not done: we're at some new starting freq.
NB.     So we add