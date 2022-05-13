#!/usr/bin/env cbqn
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
# - 0: a hydrogen M, a lithium M.
# - 1: a hydrogen G.
# - 2: a lithium G.
# - 3: nothing relevant.
# Encode: hydrogen, lithium
•Show (<"naive coding")∾< 4‿5⥊∾´ ⟨
    0‿0‿0‿0‿0
    0‿0‿0‿1‿0
    0‿1‿0‿0‿0
    1‿0‿1‿0‿1
⟩
•Show "cost‿flag‿status for Dijkstra"‿ 0‿1‿0‿1‿0‿2‿0
•Show "flag‿cost[0×256+1×64+0×16+2×4+0×1=72] for Dijkstra"‿ 1‿0
state ← ∘‿2 ⥊ ↕4⋆5
num_elements ← 5
ToIndex ← (+⟜(4⊸×))´⌽
ToState ← {
    (¯1×numElements)↑ {
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
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
num_elements ↩ 5
start ← ToIndex ⟨0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
