#!/usr/bin/env cbqn
# ⟨ToIndex, num_elements, example_start, state⟩ ⇐
⟨For⟩ ← •Import "../lib.bqn"
numKinds ← 2
numStates ← 4⋆1+2×numKinds
# Element layout:
# - expanded (0/1)
# - cost (0<)
MakeState ← (1‿0)˙¨∘↕4⊸⋆1⊸+2⊸×
states ← MakeState numKinds
•Show states
•Show "states"
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
         F state: ⌊´ state⊸F˜¨ ↕numKinds;
    kind F state:
        generator ← 1+2×kind
        microchip ← 2+2×kind
        # (generator⊑state = microchip⊑state) ∨ (∧´ 0⊸=¨ 1+2×↕numKinds)
        1
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
    IsSafe⊸/ cands
}

# Loop until reaching the goal
Seek ← { F init:
    ii ← ToIndex init
    {
        IsGoal init ? ⊑ii⊑states;
        cost ← ⊑init
        nexts ← NextStates init
        (1‿cost)˙⌾(ii⊸⊑) states
        cost+↩ 1
        {
            state ← 𝕩
            i ← ToIndex state
            cost < ⊑i⊑states ? (0‿cost)˙⌾(i⊸⊑) states; @
        }¨ nexts
        # seek the next target with the minimum cost
        init
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
states ↩ ∘‿2 ⥊ ↕4⋆(1+2×numKinds)
state ← ⟨0, 1, 0, 2, 0⟩
•Show (<"IsSafe")∾IsSafe state
start ↩ ToIndex state
•Show { (ToState 𝕩)‿𝕩‿(ToIndex ToState 𝕩) } start
"Fail to build the 1-arrow" ! (ToState∘ToIndex)⊸(∧´=) state
•Show NextStates ToState start
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
numKinds ↩ 5
states ↩ ∘‿2 ⥊ ↕4⋆(1+2×numKinds)
start ↩ ToIndex ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
