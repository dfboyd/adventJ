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

clean =: 3 : 0
   NB. turn commas and linefeeds to spaces
   ". (', ', LF, ' ') charsub y
)

NB. segments (a la Ben Eater)




tt =: readfile < jpath '~/Downloads/test-2021-08.txt'

it =: readfile < jpath '~/Downloads/input-2021-08.txt'

NB.  digit     0  1  2  3  4  5  6  7  8  9
NB.  segments  6  2  5  5  4  5  6  3  7  6

parse =: 3 : 0
  lines =: LF chopstring y
  split_at_pipes =: '|' chopstring each lines
)


a1 =: 3 : 0
  yl =: LF chopstring y
  ysplit =: }: '|' chopstring each yl
  suffixes =: 1 { each ysplit
  some =: ' ' chopstring each > each suffixes
  rest =: ' ' chopstring ' ' joinstring ' ' joinstring each some
  +/ 2 4 3 7 e.~ > # each rest
)

NB. deduction:
NB. ab = 1
NB. therefore ab are the right-hand ones, though we don't know what order.
NB. dab = 7, so we _know_ d = segment 0.
NB. if segment 0 is illuminated, and the total is:
NB. also, we know (ef) = (24) i.e. don't know the order.
NB.
NB. so if the string has a 'd', it's got segment 0 illuminated
NB. so if the count is:  6: {0 6 9}    5: {2 3 5}


NB. segments =: 10 7 $  1 1 1 0 1 1 1 0 0 1 0 0 1 0 1 0 1 1 1 1 0 1 0 \
NB. 1 1 0 1 1 0 1 1 1 0 1 0 1 1 0 1 0 1 1 1 1 0 1 1 1 1 1 0 1 0 0 1 0 \
NB. 1 1 1 1 1 1 1 1 1 1 1 0 1 1



NB. a thought:   !7 = 5040.  That's not an exorbitant number to
NB. brute force search.
NB. i.e. generate all 5040 segment-segment permutations.

NB.    n=: !N=: 7
NB.    (i.n) A. i. N
NB.  "A." is the anagram function

NB. search a boxed list of strings: (< 'abd') e. 'abc' ; 'def' ; 'ghi'

NB. take the given stringset, remap them according to each permutation
NB. then, for each set, see if all its members are in the set
NB. of valid digits.

NB.     'abcdefg' i. 'cdgba'
NB.  2 3 6 1 0
NB.  to convert from strings of letters to vectors of numbers

f =: 3 : 0
  left  =: 1,  }: */\  y
  right =: 1,~ }. */\. y
  left * right
)

