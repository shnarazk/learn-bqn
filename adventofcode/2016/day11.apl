#!/usr/bin/env cbqn
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
Decode ← { F x: 0 }
# The first floor contains a hydrogen-compatible microchip and a lithium-compatible microchip.
# The second floor contains a hydrogen generator.
# The third floor contains a lithium generator.
# The fourth floor contains nothing relevant.
•Show (<"naive coding")∾< 4‿5⥊∾´ ⟨
    0‿0‿0‿0‿0
    0‿0‿0‿1‿0
    0‿1‿0‿0‿0
    1‿0‿1‿0‿1
⟩
•Show "cost‿flag‿status for Dijkstra"‿ 0‿1‿0‿1‿0‿2‿0
•Show "flag‿cost[0×256+1×64+0×16+2×4+0×1=72] for Dijkstra"‿ 1‿0
state ← ∘‿2 ⥊ ↕4⋆5
ToIndex ← (+⟜(4⊸×))´⌽
ToState ← {
    ¯5↑ {
        F 0: ⟨0⟩;
        F n: {𝕩 ∾ F (n-𝕩)÷4} 4|n
    } 𝕩
}
example_start ← ToIndex ⟨0, 1, 0, 2, 0⟩
•Show example_start
•Show ToState example_start
•Show ToState 600
# •Show ≍⟜((Decode(1⊸⊑))¨) example
# Part 1: #####################################
# •Show +´ Decode1¨ ⥊ •FLines "../../data/2016/input-day11.txt"
# Part 2: #####################################
# •Show +´ {1 Decode2 𝕩}¨ ⥊ •FLines "../../data/2016/input-day09.txt"
