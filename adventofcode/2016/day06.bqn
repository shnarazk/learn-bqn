#!/usr/bin/env bqn

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

keys ← ⍉6↑˘∘‿7 ⥊ input
•Show keys

Pick ← { 
    i ← (¯1⊸⊏∘⍋∘⊒)˘ 𝕩
    { (0⊑𝕩)⊑(1⊑𝕩) }˘ ⍉ (i ≍ (<˘ 𝕩))
}

•Show ⊒˘ keys
•Show Pick keys
