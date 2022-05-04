#!/usr/bin/env bqn

StartsWith ← {
    len ← ≠𝕩
    0 = (<˘len↕𝕨) ⊑∘⊐⟜< 𝕩
}

input ← ⟨
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2",
⟩

•Show input
•Show (⊑ input)
•Show (<˘3↕⊑ input)
•Show (⊑ input) StartsWith "for"
