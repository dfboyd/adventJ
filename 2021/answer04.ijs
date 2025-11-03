readfile =: 1!:1

t =: readfile < jpath '~/Downloads/input04.txt'

i =: readfile < jpath '~/Downloads/input04a.txt'

eliminatecommas =: 3 : 0
  ' ' ((',' = y) # (i. # y)) } y
)

eliminateLF =: 3 : 0
  ' ' ((LF = y) # (i. # y)) } y
)

getfirstline =: 3 : '({. LF I.@E. y) {. y'

getrest =: 3 : '({. LF I.@E. y) }. y'

draws =: 3 : '". eliminatecommas getfirstline y'

boards =: 3 : 0
  restN =. ". eliminateLF getrest y
  ((25 %~ # restN), 5 5) $ restN
)

play =: 4 : 0
  NB. generate "transcript" of the game, playing each number in turn,
  NB. size is (# draws) by (# boards) by 5x5

  NB. each successive cube is the stack of marked spots on boards
  NB. after each number is drawn
  +./\ x =/ y
)

scoreup =: 3 : 0
  NB. see which boards are winners, by finding complete rows and cols
  NB. call this on  (draws play boards)
  NB.  Old version:   +./"1 (5 = +/"2 y) +. (5 = +/"1 y)
  +./"1 (*./"2 y) +. (*./"1 y)
)

find_winning_step =: 3 : 0
  NB. call on result of scoreup
  +/ -. *./"1 y
  NB. returns the step at which the first board won
)

NB. boards are always 5x5, in the test and the live input

answer04a =: 3 : 0
  d =. draws y
  b =. boards y
  transcript =. d play b
  e =. +/ -. +./"1 scoreup transcript
  NB. e is the (0-indexed) step at which there was first a winning board.

  last_called_number =. e { d

  called_numbers =. (e + 1) {. d

  winning_board_number =. 1 I.@E. e { scoreup transcript

  winning_board_contents =. winning_board_number { b
  
  unmarked =. winning_board_contents * -. winning_board_contents e. called_numbers
  unmarked_sum =. +/ , unmarked

  unmarked_sum * last_called_number
)
answer04a t

answer04b =: 3 : 0
  d =. draws y
  b =. boards y
  transcript =. d play b

  e =. +/ -. *./"1 scoreup transcript
  NB. e is the (0-indexed) first step at which all the boards are winning

  last_called_number =. e { d

  called_numbers =. (e + 1) {. d

  NB. winning_board_number =. 1 I.@E. (e { scoreup transcript) ~: ((e - 1) { scoreup transcript)
  NB. winning_board_number =. 1 I.@E. ~:/ (_1 0 + e) { scoreup transcript

  winning_board_number =. 0 I.@E. (e - 1) { scoreup transcript
  NB. to find the number of the last winning board,
  NB. row e of the scores is all 1s, so we want the location of the 0
  NB. in the previous row of the scores

  winning_board_contents =. winning_board_number { b
  
  unmarked =. winning_board_contents * -. winning_board_contents e. called_numbers
  unmarked_sum =. +/ , unmarked
  
  unmarked_sum * last_called_number
)
answer04b t

answer04 =: 3 : 0
  d =. draws y
  b =. boards y
  transcript =. d play b

  e =. (+/ -. +./"1 scoreup transcript) , +/ -. *./"1 scoreup transcript

  last_called_number =. e { d
  called_numbers =. (e + 1) {. d
