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
network ← ¯∞‿¯∞˙¨ ↕220
Link ← {
    ⟨'b', l⟩ F n: {
        min ← •BQN 6⊑l
        max ← •BQN 11⊑l
        { ( 5⊑l) StartsWith "out" ? min ↩ ¯1×1+min;@ }
        { (10⊑l) StartsWith "out" ? max ↩ ¯1×1+max;@ }
        min‿max⌾((•BQN 1⊑l)⊸⊑) n
    };
    i F x: x
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
insts ← ⌽ Decode¨ data
•Show network Link´ insts
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ data

# Part 2: #####################################
