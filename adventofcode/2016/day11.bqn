#!/usr/bin/env cbqn
# ⟨ToIndex, num_elements, example_start, state⟩ ⇐
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
numKind ← 2
state ← ∘‿2 ⥊ ↕4⋆(2×numKind)
start ← 0
ToIndex ← (+⟜(4⊸×))´⌽
ToState ← {
    (¯2×numKind)↑ {
        F 0: ⟨0⟩;
        F n: {(F (n-𝕩)÷4)∾𝕩} 4|n
    } 𝕩
}
AtFloor ← { floor F state: (¯1+floor)⊸=¨ state }
NextState ← { now F movings: 0 }        # TODO
Connected ← { floor F kind: 0 }         # TODO
IsSafe    ← { floor F kind: 0 }         # TODO
# Part 1 Description: #####################################
# - 0: a hydrogen M, a lithium M.
# - 1: a hydrogen G.
# - 2: a lithium G.
# - 3: nothing relevant.
# Encode: hydrogen, lithium
# naive coding:
#     0‿0‿0‿0‿0
#     0‿0‿0‿1‿0
#     0‿1‿0‿0‿0
#     1‿0‿1‿0‿1
# cost‿flag‿status for Dijkstra: 0‿1‿0‿1‿0‿2‿0
# For Dijkstra: flag‿cost[0×256+1×64+0×16+2×4+0×1=72] = 1‿0
# Without elevator: flag‿cost[1×64+0×16+2×4+0×1=72] = 1‿0
numKind ↩ 2
state ↩ ∘‿2 ⥊ ↕4⋆(2×numKind)
start ↩ ToIndex ⟨1, 0, 2, 0⟩
•Show { (ToState 𝕩)‿𝕩‿(ToIndex ToState 𝕩) } start
"Fail to build the 1-arrow" ! (ToState∘ToIndex)⊸(∧´=) ⟨1, 0, 2, 0⟩
•Show (3⊸AtFloor)⊸≍ ToState 600
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
numKind ↩ 5
state ↩ ∘‿2 ⥊ ↕4⋆(2×numKind)
start ↩ ToIndex ⟨0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
