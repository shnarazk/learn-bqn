#!/usr/bin/env cbqn
⟨Max, MinAt, While⟩ ← •Import "../lib.bqn"
numKinds ← 2
numStates ← 4⋆1+2×numKinds
MakeState ← ∞`(↕(4⊸⋆(1⊸+(2⊸×))))
toCheck ← ⟨init⟩
checked ← ⟨⟩
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
        (floor=generator⊑state) ∨ (∧´ {floor ≠ 𝕩⊑state}¨ 1+2×↕numKinds)
}
# Returns the set of objects which you can move with elevator from the current floor.
NextObjectsStates ← { F state:
    Mask ← {
        (¯2×numKinds)↑ {
            F 0: ⟨0⟩;
            F n: {(F (n-𝕩)÷2)∾𝕩} 2|n
        } 𝕩
    }
    objects ← {(⊑𝕩)⊸=¨ 1↓𝕩} state
    cands ← ({⌈´𝕩 ∧ objects=𝕩}¨)⊸/⍷(objects×Mask)¨ ↕2⋆2×numKinds
    {2 ≥ +´}¨⊸/cands
    {s ← +´𝕩⋄ (1≤s)∧(s≤2)}¨⊸/cands
}
# Returns the set of valid and safe states transited from the current state.
NextStates ← { F state:
    elevator ← ⊑state
    objects ← 1↓state
    w ← NextObjectsStates state
    nextFloors ← {(0≤𝕩)∧(𝕩<4)}¨⊸/⟨¯1+elevator, 1+elevator⟩
    cands ← ⥊ nextFloors {𝕨∾ ((¬𝕩)×objects) + 𝕨×𝕩}⌜ w
    IsSafe¨⊸/ cands
}
SeekStep ← { cost F ii:
    init ← ToState ii
    {
        nexts ← NextStates init
        {
            i ← ToIndex 𝕩
            ∞ = i⊑states ?
                states ↩ cost˙⌾(i⊸⊑) states
                # •Show ⟨"update", i, i⊑states⟩
            ; @
        }¨ nexts
    }
}
Seek ← { F init:
    toCheck ← ⟨init⟩
    checked ← ⟨⟩
    cost ← 0
    𝕤⋄ While {𝕤⋄ ¬(toCheck ∊ < goal)}‿{
        𝕤
        c ← 1+cost
        tmp ← ⟨⟩
        { cost = 𝕩⊑states ? tmp ≍↩ c SeekStep 𝕩; @ }¨ toCheck
        cost ↩ c
        toCheck ↩ tmp
    }
    cost
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
numKinds ↩ 2
states ↩ MakeState numKinds
start_state ← ⟨0, 1, 0, 2, 0⟩
•Show (<"IsSafe")∾IsSafe start_state
start ↩ ToIndex start_state
states ↩ ⟨⟩
# •Show { (ToState 𝕩)‿𝕩‿(ToIndex ToState 𝕩) } start
"Fail to build the 1-arrow" ! (ToState∘ToIndex)⊸(∧´=) start_state
•Show Seek start
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
# numKinds ↩ 5
# states ↩ MakeState numKinds
# start ↩ ToIndex ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# states ↩ 0˙⌾(start⊸⊑) states
# •Show Seek ToIndex ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
