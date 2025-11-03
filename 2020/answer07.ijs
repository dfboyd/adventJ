readfile =: 1!:1

load 'strings'

load 'regex'

rxgroups=: }.@rxmatch rxfrom ]    NB. like rxall but for match groups

t =: readfile < jpath '~/Code/adventJ/2020/test07.txt'

getbagname =: 3 : 0
   m =: '(.*) bags contain' rxmatch y
   if. (# m) > 1
   do.
     > (1 { '(.*) bags contain' rxmatch y) rxfrom y
   end.
)

parse_contained =: 3 : 0
   NB. given
   n =. ". > 1 {. y
   bag=. bagnames i. < ' ' joinstring 1 }. }: y
   bag, n
)

parse_line =: 3 : 0
   wds =. ' ' splitstring y
   bag =. ' ' joinstring 2 {. wds
   rest =. 4 }. wds
   if. 0 = 4 | # rest
   do.
      k =. (# rest) % 4
      m =. (k, 4) $ rest
      md =. parse_contained"1 m
      z =: (#bagnames) $ 0
      (, 1 {."1 md) (, 1 }."1 md) } z
   else.
      (#bagnames) $ 0
   end.
)   

answer07a =: 3 : 0
   lines =: LF splitstring y
   bagnames_raw =: getbagname each lines
   
   bagnames =: bagnames_raw #~ , 1 = > ($ & $) each bagnames_raw
   NB. bagnames_raw has a junk item at the end so we drop it
   graph_matrix =: parse_line each y
)


answer07a t
