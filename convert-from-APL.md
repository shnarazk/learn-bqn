# From Dyalog APL
- https://www.youtube.com/watch?v=mE5LGGPhVnQ

1. Source No.1

```apl
Euler001APL ← {+/(((3|𝕨)=0)v((5|𝕨)=0))/𝕨}
```

- fold: `/` -> `´`
- The right argument on BQN is `𝕩` instead of `𝕨`

```apl
Euler001APL ← {+/(((3|𝕨)=0)v((5|𝕨)=0))/𝕨}
Euler001BQN ← {+´(((3|𝕩)=0)∨((5|𝕩)=0))×𝕩}
```

2. Swap arguments of `=`

```apl
Euler001APL ← {+/((3|𝕩)=0)v((5|𝕩)=0)/𝕩}
Euler001BQN ← {+´((0=(3|𝕩)∨(0=(5|𝕩))×𝕩}
```

3. Unparen

```apl
Euler001APL ← {+/(0=3|𝕩)v(0=5|𝕩)/𝕩}
Euler001BQN ← {+´(0=3|𝕩)v(0=5|𝕩)×𝕩}
```

4. ?

5. ?

6. ?

```apl
    (((0=(3|⊢))⌈(0=(5|⊢)))×⊢)¨↕16
  3‿5 +´∘((↕≠)⊸×)∘(∨˝(0⊸=|)⌜) ↕10|))
```
