# From Dyalog APL
- https://www.youtube.com/watch?v=mE5LGGPhVnQ

1. Source No.1

```apl
Euler1Solve ← {+/(((3|𝕨)=0)v((5|𝕨)=0))/𝕨}
```

```
  {((3|𝕩)=0)×((5|𝕩)=0)×𝕩} ↕9
  #{(0=(3|𝕩))×(0=(5|𝕩))×𝕩}¨↕10
```

2. Swap arguments of `=`

3. Unparen

4. ?

5. ?

6. ?

```
    (((0=(3|⊢))⌈(0=(5|⊢)))×⊢)¨↕16
  3‿5 +´∘((↕≠)⊸×)∘(∨˝(0⊸=|)⌜) ↕10|))
```
