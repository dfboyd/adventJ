readfile =: 1!:1
load 'strings'
load 'regex'

s =: 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'

pstr =: 3 : 0
  > '\d+' rxall y
)

answer1 =: 3 : 0
  +/ > */ each ". each pstr each 'mul\(\d+,\d+\)' rxall y
)

answer1 s

data =: readfile < jcwdpath 'input.txt'

s2 =: 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))'

p2 =: 'mul\(\d+,\d+\)|do\(\)|don''t\(\)'

items =: p2 rxall s2

answer2 =: 3 : 0
  insns =. p2 rxall y
  M =. 'mul\(\d+,\d+\)'
  DO =. 'do\(\)'
  DONT =. 'don''t\(\)'
  on =. 1
  sum =. 0
  for_j. insns do.
    i =. > j
    if. M rxeq i do.
      if. on do. sum =. sum + */ ". pstr i end.
    elseif. DO rxeq i do.
      on =. 1
    elseif. DONT rxeq i do.
      on =. 0
    end.
  end.
  sum
)

answer2 s

answer2 s2

answer2 data
