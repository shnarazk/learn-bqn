#!/usr/bin/env bqn
example ← ⟨
    "abba[mnop]qrst"
    "abcd[bddb]xyyx"
    "aaaa[qwer]tyui"
    "ioxxoj[asdfgh]zxcvbn"
⟩
•Show example
WithMask ← {
    masks ← 1 ↓ ⟨1⟩ {
        '[' = 𝕨 ? 𝕩∾0;
        ']' = 𝕨 ? 𝕩∾1;
        𝕩∾(¯1⊑𝕩)
    }´ ⌽ 𝕩
    <˘ ⍉ masks ≍ 𝕩
}
•Show WithMask "aced[mmmm]eeef"