# Pi

## Technique: make a list of a tuple

```apl
    xs ← 0‿1∾2‿3∾4‿5≍6‿7
    Left ← { 1 + 𝕩 }
    Right ← { 3 × 𝕩 }
    { ⟨Left(0⊑𝕩)⋄Right(1⊑𝕩)⟩ } ˘ xs
┌─      
╵ 1  3  
  3  9  
  5 15  
  7 21  
       ┘
```

## Approach: make a list of a sigh-alternating sequence and the denominators
from natural numbers

```apl
    Sign ← { 1-2×2|𝕩 }
    Denom ← { ×´(0‿1‿2⊸+)(2⊸×1+𝕩) }

    { ⟨(Left(0⊑𝕩))⋄(Denom(1⊑𝕩))⟩ } ¨ {⟨𝕩⋄𝕩⟩}¨ ↕1000
⟨ ⟨ 1 24 ⟩ ⟨ ¯1 120 ⟩ ⟨ 1 336 ⟩ ⟨ ¯1 720 ⟩ ⟨ 1 1320 ⟩ ⟨ ¯1 2184 ⟩ ...

    3+4×+´{ (⟨Sign(0⊑𝕩)) ÷ (Denom(1⊑𝕩)) }¨ {⟨𝕩⋄𝕩⟩}¨ ↕1000
3.141592653340542
```

## No need to make a tuple

```apl
   3+4÷+´{ ⟨Left 𝕩)÷(Denom 𝕩⟩ }¨ ↕1000
```