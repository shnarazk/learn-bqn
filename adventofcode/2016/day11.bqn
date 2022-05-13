#!/usr/bin/env cbqn
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
Decode ← { F x: 0 }
# The first floor contains a hydrogen-compatible microchip and a lithium-compatible microchip.
# The second floor contains a hydrogen generator.
# The third floor contains a lithium generator.
# The fourth floor contains nothing relevant.
•Show (<"example")∾< example ← 4‿5⥊∾´ ⟨
    0‿0‿0‿0‿0
    0‿0‿0‿1‿0
    0‿1‿0‿0‿0
    1‿0‿1‿0‿1
⟩
# •Show ≍⟜((Decode(1⊸⊑))¨) example
# Part 1: #####################################
# •Show +´ Decode1¨ ⥊ •FLines "../../data/2016/input-day11.txt"
# Part 2: #####################################
# •Show +´ {1 Decode2 𝕩}¨ ⥊ •FLines "../../data/2016/input-day09.txt"
