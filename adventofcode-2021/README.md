# Advent of Code 2021 in BQN

- https://github.com/shnarazk/advent-of-code

# Advent of Code 2016 day 7?

```apl
  input ← "eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
"
  ⍉6↑˘∘‿7 ⥊ input
┌─                  
╵"ederatsrnnstvvde  
  eraatsdastvenrvn  
  dvnaertssnestdra  
  atdvvntrdatnsesr  
  desrresttdvvnaea  
  nerdsvavsaetdrnr" 
                   ┘
  ⊒˘⍉6↑˘∘‿7 ⥊ input
┌─                                 
╵ 0 0 1 0 0 0 0 1 0 1 1 1 0 1 1 2  
  0 0 0 1 0 0 0 2 1 1 0 1 0 1 1 1  
  0 0 0 0 0 0 0 0 1 1 1 2 1 1 1 1  
  0 0 0 0 1 0 1 0 1 1 2 1 0 0 1 1  
  0 0 0 0 1 1 1 0 1 1 0 1 0 0 2 1  
  0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 2  
                                  ┘
```
