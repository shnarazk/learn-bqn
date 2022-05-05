# I need a library

- [ ] namespace https://mlochbaum.github.io/BQN/doc/namespace.html
- [ ] unit test

- `startsWith` as an alternative to regex
- `getNumbers`; it's essential.
- Control flow https://mlochbaum.github.io/BQN/doc/control.html

```apl
If      ← {𝕏⍟𝕎@}´                 # Also Repeat
IfElse  ← {c‿T‿F: c◶F‿T@}
While   ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´  # While 1‿{... to run forever
DoWhile ← {𝕏@ ⋄ While 𝕨‿𝕩}´
For     ← {I‿C‿P‿A: I@ ⋄ While⟨C,P∘A⟩}
Match   ← {𝕏𝕨}´
Select  ← {(⊑𝕩)◶(1↓𝕩)@}
Switch ← {c←⊑𝕩 ⋄ a‿m←<˘⍉∘‿2⥊1↓𝕩 ⋄ (⊑a⊸⊐<c)◶m@}
Test    ← {fn←{C‿A𝕊e:C◶A‿E}´𝕩⋄Fn@}

StartsWith ← { (≠𝕨) < (≠𝕩) ? 0 ; 0 = (<˘(≠𝕩)↕𝕨) ⊑∘⊐⟜< 𝕩 }
GetNums ← {
  IsNum ← { (('0' ≤ 𝕩) ∧ (𝕩 ≤ '9')) ∨ ('-' = 𝕩) }
  Build ← { w F 1: { w ≤ 0 ? -w; w }; w F 0: { 0 < w ? ¯1-w; w } }
  •BQN¨ 𝕩 ⊔˜ 1- ˜0⊸<⊸× ¯1 Build` IsNum¨ 𝕩
}
```
