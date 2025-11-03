NB. having written udlr in order to propagate basins,
NB. I'm able to use that to write Conway's game of life.

xlr =: 4 :  '(_1 1) (|.!.x"0 1)/ y'
xud =: 4 :  '(_1 1) (|.!.x"0 2)/ y'

xudlr =: 4 : 'x (xud , xlr) y'
