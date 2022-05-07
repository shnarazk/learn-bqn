#!/usr/bin/env bqn
⟨For, ParseInts, StartsWith, Switch, Tokenize⟩ ← •Import "../lib.bqn"
Decode ← {
    x ← 𝕩
    l ← Tokenize 𝕩
    Switch ⟨⊑l
        "value" ⋄  { 𝕤⋄ Tokenize x}
        "bot"   ⋄  { 𝕤⋄ Tokenize x}
    ⟩
}
# Part 1: #####################################
example ← ⟨
    "value 5 goes to bot 2"
    "bot 2 gives low to bot 1 and high to bot 0"
    "value 3 goes to bot 1"
    "bot 1 gives low to output 1 and high to bot 0"
    "bot 0 gives low to output 2 and high to output 0"
    "value 2 goes to bot 2"
    ⟩
# example ← ⥊ •FLines "../data/2016/input-day08.txt"
•Show ≍⟜(Tokenize¨) example
# •Show Eval´⌽ Tokenize¨ example
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ example
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ ⥊ •FLines "../data/2016/input-day08.txt"

# Part 2: #####################################
