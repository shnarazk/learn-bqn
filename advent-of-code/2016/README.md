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
  Build ← { w F 1: { w ≤ 0 ? -w; w }; w F 0: { 0 < w ? ¯1-w; w } }
  •BQN¨ 𝕩 ⊔˜ 1- ˜0⊸<⊸× ¯1 Build` IsNum¨ 𝕩
}
GetNums "x=30, y=-5, z=55"
```

## day 10


```mermaid
flowchart TD
B2 -- 2 --> B1;
B1 -- 2 --> OUTPUT1=2;
B1 -- 3 --> B0;
B0 -- 3 --> OUTPUT2=3;
B0 -- 5 --> OUTPUT0=5;
```

| value | trace      |
|-------|------------|
| 2     | B2, B1     |
| 3     | B2, B1, B0 |
| 5     | B2, B1, B0 |

## day 11

To solve part 2, we need to implement Hash-table [object](https://mlochbaum.github.io/BQN/doc/oop.html) using with chain scheme.
- method `Add`
- method `Contains`

```apl
    MakeStack ← {𝕤
      st←@
      Push⇐{   st↩𝕩‿st}
      Pop ⇐{𝕤⋄ r‿s←st ⋄ st↩s ⋄ r}
      Len ⇐{𝕤⋄ ≠st}
    }
    s ← MakeStack @
    k ← MakeStack @
    s.Push 44
    s.Push 2
    s.Pop @
    s.Pop @
    k.Len @
```

```apl
HashTableNew ← {
  st←⟨⟩˙¨↕4⋆1+𝕩
  mask←¬2⊸|¨↕1+2×𝕩
  Key⇐{0 {𝕨+4×𝕩}´ mask/𝕩}
  Add⇐{ F 𝕩: k ← Key 𝕩 ⋄ st↩ 𝕩⊸∾⌾k⊑st}
  Contains ⇐{F 𝕩: k ← Key 𝕩 ⋄ 𝕩∊k⊑st}
  Len ⇐{𝕤⋄ ≠st}
  Dbg ⇐{mask/𝕩}
}
h ← HashTableNew 7
h.Dbg ⟨0,0,0,0,0,1,2,1,1,1,1,0,0,0,0⟩
h.Key ⟨3,0,3,0,3,1,3,1,3,1,3,0,3,0,3⟩
# h.Len @
```
