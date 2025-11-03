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

delims =:'([{<>}])'

opens =: '([{<'
closes =: ')]}>'

open_to_close =: 3 : 0
  (opens = y) # closes
)

badchar_score =: 3 : 0
  (y I.@E. closes) { 3 57 1197 25137
  NB. look up char in closes;
  NB. take corresponding badness score
)


NB.  parsing matched strings of parens

parse =: 3 : 0
  NB. two things, boxed
  stack =: > 0 { y
  string =: > 1 { y
  if. 0 < # string
  do.
    c =. (0 { string)
    if. c e. opens
    do.
      (stack , open_to_close c) ; }. string
    elseif. c e. closes
    do.
      if. ({: stack) = c
      do.
	 (}: stack) ; (}. string)
	 NB. close-delimiter matches innermost open-delimiter
	 NB. so we pop it off the stack and continue
      else.
        stack ; 0 $ 'a'
      end.
    end.
  else.
    stack ; string
  end.
)

parse2 =: 3 : 0
  NB. two things, boxed
  stack =. 0 $ 0
  string =. y
  while. 0 < # string
  NB. while string is nonempty
  do.
    c =. (0 { string)
    if. c e. opens
    NB. found an open-delimiter
    do.
      NB. save its complement on the stack
      stack =. stack , open_to_close c
    elseif. c e. closes
    do.
      if. ({: stack) = c
      do.
	 NB. close-delimiter matches innermost open-delimiter
	 NB. so we pop it off the stack and continue
         stack =. }: stack
	 NB. pop stack
      else.
	NB. we found a bad character
	NB. return its badness score
        (c I.@E. closes) { 3 57 1197 25137 return.
      end.
    end.
    string =. }. string
  end.
  if. 0 = # stack
  do.
    0 return.  NB. string is empty, stack is empty: correct parse
  else.
    _1 return.  NB. stack is empty but stack is nonempty; incomplete string
  end.
)


ans1 =: 3 : 0
  strings =: }: LF splitstring y
  a =: , > parse2 each strings
  (0 < a) # a
)

parse3 =: 3 : 0
  stack =. 0 $ 0
  string =. y
  while. 0 < # string
  NB. while string is nonempty
  do.
    c =. (0 { string)
    if. c e. opens
    NB. found an open-delimiter
    do.
      NB. save its complement on the stack
      stack =. stack , open_to_close c
    elseif. c e. closes
    do.
      if. ({: stack) = c
      do.
	 NB. close-delimiter matches innermost open-delimiter
	 NB. so we pop it off the stack and continue
         stack =. }: stack
	 NB. pop stack
      else.
	NB. we found a bad character
	NB. return _1
        0 return.
      end.
    end.
    string =. }. string
  end.
  if. 0 = # stack
  do.
    _1 return.  NB. string is empty, stack is empty: correct parse
  else.
    NB. string is empty but stack is nonempty; incomplete string
    scores =: 1 + closes i. (|. stack)
    (5 #~ $ scores) #. scores return.
  end.
)

ans2 =: 3 : 0
  strings =: }: LF splitstring y
  a =: , > parse3 each strings
  sl =: (0 < a) # a
  (<. ($ sl) % 2) { /:~ sl
)

inverse =: 3 : 0
  (delims i. y) { |. delims
)

open =: 3 : 0
  (delims i. y) < ($ delims) % 2
)
close =: 3 : 0
  (delims i. y) > ($ delims) % 2
)

NB.  what I want here is to read all the lines and split into 

LF chopstring s

t =: readfile < jpath  '~/Downloads/test-2021-10.txt'


inverse '('

(delims i. '(') { |. delims

points =: 3 57 1197 25137

g =: '[<>({}){}[([])<>]]'

t =: readfile < jpath '~/Downloads/test-2021-10.txt'
   
i =: readfile < jpath '~/Downloads/input-2021-10.txt'

parse3 =: 3 : 0
  NB. two things, boxed
  stack =: > 0 { y
  string =: > 1 { y
  if. 0 < # string
  do.
    c =. (0 { string)
    if. c e. opens
    do.
      (stack , open_to_close c) ; }. string
    elseif. c e. closes
    do.
      if. ({: stack) = c
      do.
	 (}: stack) ; (}. string)
	 NB. close-delimiter matches innermost open-delimiter
	 NB. so we pop it off the stack and continue
      else.
        stack ; 0 $ 'a'
      end.
    end.
  else.
    stack ; string
  end.
)
