#!/usr/bin/env bqn
example ← ⟨
    "abba[mnop]qrst"
    "abcd[bddb]xyyx"
    "aaaa[qwer]tyui"
    "ioxxoj[asdfgh]zxcvbn"
⟩
•Show example
WithMask0 ← {
    masks ← 1 ↓ ⟨1⟩ {
        '[' = 𝕨 ? 𝕩∾0;
        ']' = 𝕨 ? 𝕩∾1;
        𝕩∾(¯1⊑𝕩)
    }´ ⌽ 𝕩
    <˘ ⍉ masks ≍ 𝕩
}
Split ← { F letters:
    masks ← ⟨⟨""⟩, 1⟩ {
        '[' 𝕊 𝕩 : ⟨⊑𝕩, ¯1×(1⊑𝕩)⟩;
        ']' 𝕊 𝕩 : ⟨⟨""⟩∾(⊑𝕩), 1+(¯1×(1⊑𝕩))⟩;
        1⊑𝕩 < 0 ? 𝕩;
        ⟨⟨(𝕨∾⊑⊑𝕩)⟩∾(1↓⊑𝕩), 1⊑𝕩⟩
    }´ ⌽ letters
    ⌽¨⌽⊑masks
}
•Show Split (⊑example)