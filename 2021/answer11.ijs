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
digitsonly =: 3 : 0
  (

expand =: 3 : 0
  ,/ (_1 0 1) (,."0 0)/ (_1 0 1)

xypm =: (4&{. , _4&{.) ,/ (_1 0 1) (,."0 0)/ (_1 0 1)
NB. x y plus minus: all udlr+diag offets to shift matrix

expand =: 3 : 0
   +/ xypm (|.!.0)/ y
)


parse =: 3 : 0
  nums =. ". |: ((t1 e. '0123456789') # y) ,: ' '
  n =. %: $ nums
  (n, n) $ nums
)

step1 =: 3 : 0
  m =: y
  m =: m + 1
  flashes =: m > 9
  newflashes =: expand flashes
  m =: m + newflashes
  m ; newflashes ; flashes
)

t0 =: 5 5 $ 1 1 1 1 1 1 9 9 9 1 1 9 1 9 1 1 9 9 9 1

step_auto =: 3 : 0
  m =: y
  m =: m + 1
  af =: ($m) $ 0
  NB. all-flashes array is initially all zeroes
  while. +./ , m > 9
  NB. if any elt is greater than 9
  do.
     nf =: (m > 9) *. -. af
     NB. new flashes = 
     m =: m + expand nf
     af =: af +. nf
     m =: m * -. af
     NB. newly-flashed octopuses are added to af
  end.
  m return.
)  

t1 =: readfile < jpath '~/Code/adventJ/2021/11-t1.txt'
t1t =: , t1 ,. ' '

ans1 =: 4 : 0
  m =: y
  nfc =: 0
  for. i. x
  do.
    m =: m + 1
    af =: ($m) $ 0
    NB. all-flashes array is initially all zeroes
    while. +./ , m > 9
    NB. if any elt is greater than 9
    do.
       nf =: (m > 9) *. -. af
       NB. new flashes = 
       nfc =: nfc + +/ , nf
       NB. new flashes count
       m =: m + expand nf
       af =: af +. nf
       m =: m * -. af
       NB. newly-flashed octopuses are added to af
    end.
  end.
  nfc return.
)  

i =: readfile < jpath '~/Downloads/input-2021-11.txt'

ans2 =: 3 : 0
  m =: y
  stepcount =: 0
  fc =: 0
  while. -. 0 = +/ , m
  NB. while m has any nonzero elements
  do.
    m =: m + 1
    stepcount =: stepcount + 1
    af =: ($m) $ 0
    NB. all-flashes array is initially all zeroes
    while. +./ , m > 9
    NB. if any elt is greater than 9
    do.
       nf =: (m > 9) *. -. af
       NB. new flashes = 
       nfc =: +/ , nf
       NB. new flashes count
       m =: m + expand nf
       af =: af +. nf
       m =: m * -. af
       NB. newly-flashed octopuses are added to af
    end.
  end.
  stepcount return.
)
