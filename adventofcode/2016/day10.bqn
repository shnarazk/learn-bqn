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
status ↩ 3‿¯∞⌾(2⊸⊑) status
status ↩ 2‿¯∞⌾(3⊸⊑) status
trace ← ⟨⟩˙¨ ↕220
Dispatch ← {
 ⟨'v', l⟩ F ⟨status, trace⟩:
    •Out ∾ (1⊑l)‿" => "‿(5⊑l)
    index ← •BQN 5⊑l
    val ← •BQN 1⊑l
    min ← 0⊑index⊑ status
    max ← 1⊑index⊑ status
    "assumption error" ! (max = ¯∞)
    {
        min = ∞ ? min ↩ val;
        min < val ? max ↩ val;
        max ↩ min ⋄ min ↩ val
    }
    ⟨min‿max⌾(index⊸⊑) status, ⟨index⟩˙⌾(val⊸⊑) trace⟩
    ;
 ⟨'b', l⟩ F ⟨status, trace⟩:
    •Out ∾ (1⊑l)‿" "‿(3⊑l)‿" -> "‿(6⊑l)‿" and "‿(8⊑l)‿" -> "‿(11⊑l)
    index ← •BQN 1⊑l
    li ← 0⊑index⊑ status
    low ← •Repr li
    hi ← 1⊑index⊑ status
    high ← •Repr hi
    {
        (5⊑l) StartsWith "bot" ?
            "assumption error" ! (low ≠ ¯∞)
            status ↩ ⟨'v', "value"‿low‿"goes"‿"to"‿"bot"‿(6⊑l)⟩ Dispatch status
            •Show li
            trace ↩ (index⊸∾)⌾(li⊸⊑) trace
            ;
        @
    }
    {
        (10⊑l) StartsWith "bot" ?
            "assumption error" ! (high ≠ ¯∞)
            status ↩ ⟨'v', "value"‿high‿"goes"‿"to"‿"bot"‿(11⊑l)⟩ Dispatch status
            trace ↩ (index⊸∾)⌾(hi⊸⊑) trace
            ;
        @
    }
    ⟨status, trace⟩
    ;
 instruction F x: x
}
Assign ← { ⟨'v', l⟩ F ⟨status, trace⟩:
    •Out ∾ (1⊑l)‿" => "‿(5⊑l)
    index ← •BQN 5⊑l
    val ← •BQN 1⊑l
    min ← 0⊑index⊑ status
    max ← 1⊑index⊑ status
    "assumption error" ! (max = ¯∞)
    {
        min = ∞ ? min ↩ val;
        min < val ? max ↩ val;
        max ↩ min ⋄ min ↩ val
    }
    ⟨min‿max⌾(index⊸⊑) status, ⟨index⟩˙⌾(val⊸⊑) trace⟩
    ;
 instruction F x: x
}
Distibute ← { ⟨'b', l⟩ F ⟨status, trace⟩:
    •Out ∾ (1⊑l)‿" "‿(3⊑l)‿" -> "‿(6⊑l)‿" and "‿(8⊑l)‿" -> "‿(11⊑l)
    index ← •BQN 1⊑l
    li ← 0⊑index⊑ status
    low ← •Repr li
    hi ← 1⊑index⊑ status
    high ← •Repr hi
    {
        (5⊑l) StartsWith "bot" ?
            "assumption error" ! (low ≠ ¯∞)
            status ↩ ⟨'v', "value"‿low‿"goes"‿"to"‿"bot"‿(6⊑l)⟩ Dispatch status
            •Show li
            trace ↩ (index⊸∾)⌾(li⊸⊑) trace
            ;
        @
    }
    {
        (10⊑l) StartsWith "bot" ?
            "assumption error" ! (high ≠ ¯∞)
            status ↩ ⟨'v', "value"‿high‿"goes"‿"to"‿"bot"‿(11⊑l)⟩ Dispatch status
            trace ↩ (index⊸∾)⌾(hi⊸⊑) trace
            ;
        @
    }
    ⟨status, trace⟩
    ;
 instruction F x: x
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
st1 ← ⟨status, trace⟩ Assign´ insts
•Show st1 Distibute´ insts
# •Show +´'#'=¨ ⥊ Eval´⌽ Decode¨ data

# Part 2: #####################################
