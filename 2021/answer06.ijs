NB. lanternfish

NB. 1. all fish lose a day.
NB. 2. 0s this day, append an 8 for each one.


NB. ----------------------------------------------------------------------
NB. prelims: parsing / loading the input
NB. ----------------------------------------------------------------------

readfile =: 1!:1

i =: readfile < jpath '~/Downloads/input-2021-06.txt'

eliminatecommas =: 3 : 0
  ' ' ((',' = y) # (i. # y)) } y
)

eliminateLF =: 3 : 0
  ' ' ((LF = y) # (i. # y)) } y
)

NB. had some trouble getting the string to parse
NB. Eventually this worked:

it =: eliminateLF eliminatecommas i

NB. ----------------------------------------------------------------------
NB. first version
NB. ----------------------------------------------------------------------

simulate =: 3 : 0
  NB. This version solves the problem as shown in the example.
  NB. It keeps the individual fish timers in an array.
  state =. y
  newfish =: +/ 0 = state
  ((state - 1) + (7 * _1 = state - 1)), newfish $ 8
)

$ simulate^:80 it

NB.  the ^:n suffix (adverb?) applies the function n times to its input
NB.  So the initial answer was this.

NB.  But when I tried this:
NB.     $ simulate^:256 i
NB.  it didn't finish, and the computer fan started running.
NB.  Exponential growth.

NB. So I tried a different tack: instead of keeping each individual fish,
NB. I just keep the count of the number of fish with each timer value.
NB. Then simulating a step of time becomes:

init =: 3 : 0
  NB. collect counts of each value
  +/"1 (i. 9) =/ y
)

simulate2 =: 3 : 0
  zeroes =: 0 { y
  NB. Take the number of fish with zero timer.

  new =: ((1 }. y), 0) + 0 0 0 0 0 0, zeroes, 0, zeroes
  NB. chop the 0 off the bottom and everyone else drops one,
  NB. simulating one timer tick.
  NB. Then add a zero to the top, so the array is the right length again.
  NB. Then add the zero-count-fish to position 6 (mothers)
  NB. and to position 8 (babies).
)

+/ simulate2^:256 init it
