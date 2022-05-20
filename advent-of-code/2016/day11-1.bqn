#!/usr/bin/env cbqn
⟨Max, MinAt, While⟩ ← •Import "../lib.bqn"
toCheck ← ⟨⟩
checked ← ⟨⟩
numKinds ← 1
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
SeekStep ← { checked F ii:
    init ← ToState ii
    list ← ⟨⟩
    {
        {
            i ← ToIndex 𝕩
            # •Show ⟨"from", ii, "to", i, list⟩
            ⟨i⟩ ¬∘⊑∘∊ checked ? list∾↩⟨i⟩ ; @
        }¨ NextStates init
    }
    list
}
Seek ← { F init:
    numKinds ↩ 2÷˜¯1+≠init
    goal ← ¯1+4⋆≠init
    toCheck ← ⟨ToIndex init⟩
    checked ← ⟨⟩
    cost ← 0
    𝕤⋄ While {𝕤⋄ ⟨goal⟩ ¬∘⊑∘∊ checked}‿{
        𝕤
        •Show ⟨"cost", cost⟩
        cost+↩1
        tmp ← toCheck
        checked ∾↩ toCheck
        toCheck ↩ ∾´ {checked SeekStep 𝕩}¨ tmp
        # ! 0 < ≠toCheck
    }
    cost-1
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
•Show Seek ⟨0, 1, 0, 2, 0⟩
# Part 1: #####################################
# - 0: a strontium G, a strontium M, a plutonium G, a plutonium M.
# - 1: a thulium G, a ruthenium G, a ruthenium M, a curium G, a curium M.
# - 2: a thulium M.
# - 3: nothing relevant.
# Encode: strontium, plutonium, thulium, ruthenium, curium
•Show Seek ⟨0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1⟩
# Part 2: #####################################
