#!/usr/bin/env bqn
⟨Min, Max, StartsWith, Switch, Tokenize⟩ ← •Import "../lib.bqn"
Decode ← {
    x ← 𝕩
    l ← Tokenize 𝕩
    Switch ⟨⊑l
        "value" ⋄  { 𝕤⋄ 'v'‿(1↓l)}
        "bot"   ⋄  { 𝕤⋄ 'b'‿(1↓l)}
    ⟩
}
# Part 1: #####################################
Link ← {
    ⟨'b', l⟩ F n: {
        min ← •BQN 5⊑l
        max ← •BQN 10⊑l
        { (4⊑l) StartsWith "out" ? min ↩ ¯1×1+min;@ }
        { (9⊑l) StartsWith "out" ? max ↩ ¯1×1+max;@ }
        min‿max⌾((•BQN ⊑l)⊸⊑) n
    };
    i F x: x
}
SetToken ← {
    ⟨'v', l⟩ F pn: {
        val ← •BQN 0⊑l
        idx ← •BQN 4⊑l
        fst ← 1⊑idx⊑pn
        {
            fst ≠ ¯∞ ? val˙⌾(1⊸⊑idx⊸⊑) pn;
            mi ← fst Min val
            ma ← fst Max val
            (1‿mi‿ma)˙⌾(idx⊸⊑) pn
        }
    };
    i F x: x
}
Unpropagated ← { pn F idx:
    record ← idx⊑pn
    (0⊑record = 0) ∧ (1⊑record ≠ ¯∞) ∧ (2⊑record ≠ ¯∞)
}
Propagate ← {
    𝕩
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
network ← (¯∞‿¯∞˙¨ ↕220) Link´ insts
petri ← (0‿¯∞‿¯∞˙¨ ↕220) SetToken´ insts
•Show network
•Show petri
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ data

# Part 2: #####################################
