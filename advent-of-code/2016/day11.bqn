#!/usr/bin/env cbqn
⟨For, MaxAt⟩ ← •Import "../lib.bqn"
numKinds ← 2
numStates ← 4⋆1+2×numKinds
# Element layout:
# - expanded (0/1)
# - cost (0<)
# - state index
MakeState ← {(<⟨1, ∞, ¯1⟩) {⟨1, ∞, 1+2⊑𝕨⟩}` 𝕩}(↕(4⊸⋆(1⊸+(2⊸×))))
states ← MakeState numKinds
# •Show states
# •Show "states"
start ← 0
ToIndex ← (+⟜(4⊸×))´⌽
ToState ← {
    (¯1+¯2×numKinds)↑ {
        F 0: ⟨0⟩;
        F n: {(F (n-𝕩)÷4)∾𝕩} 4|n
    } 𝕩
}

# Return 1 if 𝕩 is safe for all microtips
IsSafe ← { 
         F state: ⌊´ state⊸(F˜)¨ ↕numKinds;
    kind F state:
        floor ← (2+2×kind)⊑state
        generator ← 1+2×kind
        # •Show ⟨"kind", kind, state, (floor=generator⊑state) ∨ (∧´ {floor ≠ 𝕩⊑state}¨ 1+2×↕numKinds)⟩
        (floor=generator⊑state) ∨ (∧´ {floor ≠ 𝕩⊑state}¨ 1+2×↕numKinds)
}
IsGoal ← { F state: ∧´ {3=𝕩⊑state}¨ 1+2×↕numKinds }
# Returns the set of objects which you can move with elevator from the current floor.
NextObjectsStates ← { F state:
    Mask ← {
        (¯2×numKinds)↑ {
            F 0: ⟨0⟩;
            F n: {(F (n-𝕩)÷2)∾𝕩} 2|n
        } 𝕩
    }
    objects ← {(⊑𝕩)⊸=¨ 1↓𝕩} state
    # •Show (objects×Mask)¨ ↕2⋆2×numKinds
    # •Show ⍷(⌈´objects×Mask)¨ ↕2⋆2×numKinds
    ({⌈´𝕩 ∧ objects=𝕩}¨)⊸/⍷(objects×Mask)¨ ↕2⋆2×numKinds
}

# Returns the set of valid and safe states transited from the current state.
NextStates ← { F state:
    elevator ← ⊑state
    objects ← 1↓state
    w ← NextObjectsStates state
    nextFloors ← elevator⊸≠¨⊸/ ↕4
    # •Show ⥊ nextFloors {𝕨∾ 𝕨×𝕩}⌜ w
    cands ← ⥊ nextFloors {𝕨∾ ((¬𝕩)×objects) + 𝕨×𝕩}⌜ w
    •Show IsSafe¨ cands
    results ← IsSafe¨⊸/ cands
    •Show ⟨>≠cands, " => ", >≠results⟩
    results
}

# Loop until reaching the goal
Seek ← { F init:
    ii ← ToIndex init
    {
        IsGoal init ? ⊑ii⊑states;
        cost ← ⊑init
        nexts ← NextStates init
        •Show ≠ nexts
        (1‿cost‿ii)˙⌾(ii⊸⊑) states
        cost+↩ 1
        {
            state ← 𝕩
            i ← ToIndex state
            •Show ⟨"update: ", i, 1⊑i⊑states⟩
            cost < 1⊑i⊑states ? states ↩ (0‿cost‿i)˙⌾(i⊸⊑) states; @
        }¨ nexts
        •Show "eee"
        •Show {0=⊑𝕩}¨⊸/states
        next ← 2⊸⊑ 1⊸MaxAt {0=⊑𝕩}¨⊸/states
        F next
    }
}
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
numKinds ↩ 2
states ↩ MakeState numKinds
start_state ← ⟨0, 1, 0, 2, 0⟩
•Show (<"IsSafe")∾IsSafe start_state
start ↩ ToIndex start_state
•Show { (ToState 𝕩)‿𝕩‿(ToIndex ToState 𝕩) } start
"Fail to build the 1-arrow" ! (ToState∘ToIndex)⊸(∧´=) start_state
# •Show NextStates ToState start
•Show Seek start_state
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
numKinds ↩ 5
states ↩ MakeState numKinds
start ↩ ToIndex ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
