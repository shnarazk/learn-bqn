#!/usr/bin/env cbqn
# ⟨ToIndex, num_elements, example_start, state⟩ ⇐
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
numKind ← 2
numStates ← 4⋆1+2×numKind
# MakeState ← (∘‿2)⊸⥊↕4⊸⋆1⊸+2⊸×
MakeState ← ↕4⊸⋆1⊸+2⊸×
state ← MakeState numKind
start ← 0
ToIndex ← (+⟜(4⊸×))´⌽
ToState ← {
    (¯1+¯2×numKind)↑ {
        F 0: ⟨0⟩;
        F n: {(F (n-𝕩)÷4)∾𝕩} 4|n
    } 𝕩
}
AtFloor ← { floor F state: (¯1+floor)⊸=¨ state }
NextStates ← { F state:
    Mask ← {
        (¯2×numKind)↑ {
            F 0: ⟨0⟩;
            F n: {(F (n-𝕩)÷2)∾𝕩} 2|n
        } 𝕩
    }
    objects ← {(⊑𝕩)⊸=¨ 1↓𝕩} state
    # •Show objects
    # •Show Mask¨ ↕2⋆2×numKind
    # •Show (objects×Mask)¨ ↕2⋆2×numKind
    # •Show ⍷(⌈´objects×Mask)¨ ↕2⋆2×numKind
    ({⌈´𝕩 ∧ objects=𝕩}¨)⊸/⍷(objects×Mask)¨ ↕2⋆2×numKind
}
Connected  ← { kind F state: 0 }         # TODO
IsSafe     ← { kind F state: 0 }         # TODO
IsNextState ← { current F next: 0 }      # TODO
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
# flag‿cost‿status for Dijkstra(plae the position of elevator at first): 0‿0‿0‿1‿0‿2‿0
# For Dijkstra: flag‿cost[0×256+1×64+0×16+2×4+0×1=72] = 1‿0
numKind ↩ 2
state ↩ ∘‿2 ⥊ ↕4⋆(1+2×numKind)
start ↩ ToIndex ⟨0, 1, 0, 2, 0⟩
•Show { (ToState 𝕩)‿𝕩‿(ToIndex ToState 𝕩) } start
"Fail to build the 1-arrow" ! (ToState∘ToIndex)⊸(∧´=) ⟨0, 1, 0, 2, 0⟩
•Show (3⊸AtFloor)⊸≍ ToState 600
•Show NextStates ToState start
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
numKind ↩ 5
state ↩ ∘‿2 ⥊ ↕4⋆(1+2×numKind)
start ↩ ToIndex ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
