#!/Users/nash/.local/bin/bqn
# !/usr/bin/env bqn
⟨For, GetNums, StartsWith⟩ ← •Import "../lib.bqn"
Decode ← {
    𝕩 StartsWith "rect"       ? 'E'∾GetNums 𝕩;
    𝕩 StartsWith "rotate col" ? 'C'∾GetNums 𝕩;
    𝕩 StartsWith "rotate row" ? 'R'∾GetNums 𝕩;
    𝕩 ! 0
}
# Part 1: #####################################
Eval ← {
    ⟨'E', w, h⟩ F 𝕩:
        tmp ← 𝕩
        For (c ← 0)‿{𝕤⋄ c < h}‿{𝕤⋄ c+↩1}‿{ 𝕤
            tmp ↩ '#'¨⌾((↕w)⊸⊏ c⊸⊏) tmp
        }
        tmp
        ;
    ⟨'C', c, n⟩ F 𝕩: ((-n)⊸⌽)⌾(c⊸⊏˘) 𝕩 ;
    ⟨'R', r, n⟩ F 𝕩: ((-n)⊸⌽)⌾(r⊸⊏) 𝕩 ;
    𝕨 F 𝕩: 𝕨 ! 0
}
screen ← 6‿50 ⥊ '.'˙↕300
example ← ⟨ "rect 3x2", "rotate column x=1 by 1", "rotate row y=0 by 4", "rotate column y=1 by 1" ⟩
# example ← 4↑ ⥊ •FLines "../data/2016/input-day08.txt"
•Show ≍⟜(Decode¨) example
•Show screen Eval´⌽ Decode¨ example
•Show +´'#'=¨ ⥊ screen Eval´⌽ Decode¨ example
•Show +´'#'=¨ ⥊ screen Eval´⌽ Decode¨ ⥊ •FLines "../data/2016/input-day08.txt"

# Part 2: #####################################
