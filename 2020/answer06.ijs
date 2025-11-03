readfile =: 1!:1
load 'strings'

az =: 26 {. (65 + 32) }. a.

answers =. 'abcx'
NB. examplea answers


az e. answers
NB. gives boolean vector, of which letters are present in 'answers'.


t6 =. readfile < jpath '~/Code/adventJ/2020/t06.txt'

parse =: 3 : 0
  (LF,LF) splitstring y
  NB. parses input into list of boxes, each containing one stanza
  NB. each box contains lines of that stanza
)

answer06a =: 3 : 0
  d =. (LF,LF) splitstring y
  booleans =. > (az & e.) each d
  +/ , booleans
)

onestr =: 3 : 0
  *./ > (az & e.) each ' ' splitstring > y
)

answer06b =: 3 : 0
  LFLF =. LF, LF
  tokenized =. }: (LFLF ; '/' ; LF ; ' ') stringreplace y
  NB. abc/a b c/ab ac/a a a a/b
  d =: '/' splitstring tokenized
  NB. *./ (az & e.) each (' ' & splitstring ) each d
  NB. (az & e.) each (' ' & splitstring) each d
  +/ , > onestr each d
)

answer06b t6
