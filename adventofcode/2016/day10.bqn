#!/usr/bin/env bqn
⟨For, ParseInts, StartsWith, Switch, Tokenize⟩ ← •Import "../lib.bqn"
Decode ← {
    x ← 𝕩
    l ← Tokenize 𝕩
    Switch ⟨⊑l
        "value" ⋄  { 𝕤⋄ 'v'‿(Tokenize x)}
        "bot"   ⋄  { 𝕤⋄ 'b'‿(Tokenize x)}
    ⟩
}
# Part 1: #####################################
status ← ∞‿¯∞˙¨ ↕220
Dispatch ← {
 ⟨'v', l⟩ F status:
    •Show 1⊑l
    index ← •BQN 5⊑l 
    val ← •BQN 1⊑l 
    min ← ⊑index⊑ status
    max ← ⊑index⊑ status
    val‿val⌾(index⊸⊑) status
    ;
 instruction F status: status
}

example ← ⟨
    "value 5 goes to bot 2"
    "bot 2 gives low to bot 1 and high to bot 0"
    "value 3 goes to bot 1"
    "bot 1 gives low to output 1 and high to bot 0"
    "bot 0 gives low to output 2 and high to output 0"
    "value 2 goes to bot 2"
    ⟩
•Show ≍⟜(Decode¨) example
data ← ⥊ •FLines "../data/2016/input-day10.txt"
•Show ≍⟜(Decode¨) 2↑ data
•Show status Dispatch´⌽ Decode¨ data
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ data

# Part 2: #####################################
