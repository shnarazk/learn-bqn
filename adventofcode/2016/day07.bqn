#!/usr/bin/env bqn
example ← ⟨ "abba[mnop]qrst", "abcd[bddb]xyyx", "aaaa[qwer]tyui", "ioxxoj[asdfgh]zxcvbn" ⟩
a_example ← 5↑ ⥊ •FLines "../data/2016/input-day07.txt"
Split ← { F letters:
    records ← ⟨1, ⟨""⟩, ⟨⟩⟩ {
        '[' 𝕊 𝕩 : ⟨¯1×(⊑𝕩)    , 1⊑𝕩               , ⟨""⟩∾(2⊑𝕩)       ⟩;
        ']' 𝕊 𝕩 : ⟨1+(¯1×(⊑𝕩)), ⟨""⟩∾(1⊑𝕩)        , 2⊑𝕩              ⟩;
        0 < ⊑𝕩 ?  ⟨⊑𝕩         , ⟨(𝕨∾⊑1⊑𝕩)⟩∾(1↓1⊑𝕩), 2⊑𝕩              ⟩;
                  ⟨⊑𝕩         , 1⊑𝕩               , ⟨(𝕨∾⊑2⊑𝕩)⟩∾(1↓2⊑𝕩)⟩
    }´ ⌽ letters
    (⌽¨1⊑records)‿(⌽¨2⊑records)
}
Check ← {
    CheckWord ← { (0⊑𝕩 = 3⊑𝕩) ∧ (1⊑𝕩 = 2⊑𝕩) ∧ (0⊑𝕩 ≠ 1⊑𝕩) }
    CheckChunk ← { 4 > ≠𝕩 ? 0; 0 < ⌈´CheckWord¨ <˘4↕𝕩 }
    (0 < ⌈´CheckChunk¨ 0⊑𝕩) ∧ (0 = ⌈´CheckChunk¨ 1⊑𝕩)
}
•Show example
•Show ⥊>Split¨ example
•Show (Check∘Split)¨ example
•Show +´(Check∘Split)¨ ⥊ •FLines "../data/2016/input-day07.txt"
