# 

## Day 6

- https://adventofcode.com/2016/day/6

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
  Pick ← ???
  ⟨ 0 0 1 0 0 0 0 1 0 1 1 1 0 1 1 2 ⟩ Pick "ederatsrnnstvvde"
'e'
```

```apl
   ¯1⊑⍋⍋⟨ 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 2 ⟩
 15
   Pick ← { 
    i ← ¯1⊑⍋⍋ 𝕨
    i⊑𝕩
  }
   ⟨ 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 2 ⟩ Pick (⊏⍉6↑˘∘‿7 ⥊ input)
 'e'
 ```

- How to get an atom from an unit array? ▶️ `>`

#### How to find the least char

|   |                  |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
|---|------------------|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|
|   |  `𝕩`             |'e'|'d'|'e'|'r'|'a'|'t'|'s'|'r'|'n'|'n'|'s'|'t'|'v'|'v'|'d'|'e'|
| a | `(1+ ⊒)¨`        | 1 | 1 | 2 | 1 | 1 | 1 | 1 | 2 | 1 | 2 | 2 | 2 | 1 | 2 | 2 | 3 |
| b | `(⌽∘∊∘⌽)¨`       | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |
| c |  `b × a`         | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 2 | 0 | 2 | 2 | 2 | 0 | 2 | 2 | 3 |
| d | `c + 96 × 1 - b` |96 | 96| 96| 96| 1 |96 |96 | 2 | 96| 2 | 2 | 2 | 96| 2 | 2 | 3 |
| e |  `⌊´¨d`          |   |   |   |   | 1 |   |   |   |   |   |   |   |   |   |   |   |
| f |  `e ⊐ a`         |   |   |   |   | 4 |   |   |   |   |   |   |   |   |   |   |   |
|   |  `f ⊑ 𝕩`         |   |   |   |   |'a'|   |   |   |   |   |   |   |   |   |   |   |


- a: 別に1を足さなくても計算に支障はない
- b: 最右出現を求めたい
- c: この中で最小のものが求めるもの。ただし0は除く
- d: 96は添字として出現しない大きな数の一例
- e → f: 最小値の添字の場所の文字が求めるもの

## day 8

```apl
GetNums ← {
  IsNum ← { (('0' ≤ 𝕩) ∧ (𝕩 ≤ '9')) ∨ ('-' = 𝕩) }
  Scanner ← {
    w F 1: { w ≤ 0 ? -w; w };
    w F 0: { 0 < w ? ¯1-w; w }
  }
  •BQN¨ 𝕩 ⊔˜ 1-˜0⊸<⊸× ¯1 Scanner` IsNum¨ 𝕩
}
GetNums "x=30, y=-5, z=55"
```
