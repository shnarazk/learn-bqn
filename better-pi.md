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
    Deniminator ← { ??? }
    { ⟨Sign(0⊑𝕩)⋄ RDenominator(1⊑𝕩)⟩ } ˘ xs
