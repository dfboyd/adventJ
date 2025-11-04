readfile =: 1!:1
load 'strings'
load 'regex'

m =: > cutopen 0 : 0
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
)

rows =: 3 : 0
  # 'XMAS' rxall y
)

dots =: 3 : 0
  ('XMAS';'....') rxrplc y
)

> rows each 'XMASZXMAS';'XMASDDD'

'XMASZXMAS';'XMASDDD'

<"1  m

> rows each <"1 m

answer1 =: 3 : 0
  lr =. +/ > rows each <"1 y
  rl =. +/ > rows each <"1 |."1 y

  ns =. +/ > rows each <"1 |: y
  sn =. +/ > rows each <"1 |."1 |: y

  sw =. +/ > rows each < /. y
  se =. +/ > rows each < /. |."1 y
  ne =. +/ > rows each < /. |: y
  nw =. +/ > rows each < /. |: |."1 y
  +/ lr , rl , ns , sn , sw , nw , ne , se
)

answer1 m

data =: cutopen (readfile < jcwdpath 'input.txt')

answer1 data

m2 =: > cutopen 0 : 0
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
)

x_mas =: 3 : 0
  re =: 'M.M.A.S.S'
  N =: re rxeq , y
  W =: re rxeq , |: y
  E =: re rxeq , |: |."1 y
  S =: re rxeq , |. y
  +/ N, W, E, S
)

answer2 =: 3 : 0
  boxes =. 3 3 (<;._3) y
  +/ , > x_mas each boxes
)

answer2 m

answer2 data
