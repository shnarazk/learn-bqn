#!/usr/bin/env bqn

example ← "eedadn
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

example_keys ← ⍉6↑˘∘‿7 ⥊ example
•Show example_keys

Pick ← { 
    i ← (¯1⊸⊏∘⍋∘⊒)˘ 𝕩
    { (0⊑𝕩)⊑(1⊑𝕩) }˘ ⍉ (i ≍ (<˘ 𝕩))
}

# •Show ⊒˘ example_keys
•Show Pick example_keys

lines ← ⥊ •FLines "../data/2016/input-day06.txt"
•Show 10 ↑ lines
keys ← ⍉ ∘‿8 ⥊ ∾´ lines
•Show keys
•Show Pick keys
