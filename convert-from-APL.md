# From Dyalog APL

- https://www.youtube.com/watch?v=mE5LGGPhVnQ
- https://mlochbaum.github.io/BQN/doc/fromDyalog.html

## 1. The source No.1

```apl
Euler001APL ← {+/(((3|𝕨)=0)∨((5|𝕨)=0))/𝕨}
```

- fold: `/` -> `´`
- The right argument on BQN is `𝕩` instead of `𝕨`

```apl
Euler001APL ← {+/(((3|𝕨)=0)∨((5|𝕨)=0))/𝕨}
Euler001BQN ← {+´(((3|𝕩)=0)∨((5|𝕩)=0))×𝕩}
```

Note: The vector from BQN version contains zeros for invalid values.

## 2. Swap the arguments of `=`

```apl
Euler001APL ← {+/((3|𝕩)=0)∨((5|𝕩)=0)/𝕩}
Euler001BQN ← {+´((0=(3|𝕩:)∨(0=(5|𝕩))×𝕩}
```

## 3. Unparen (partially evaluated) functions which left argument is given

```apl
Euler001APL ← {+/(0=3|𝕩)∨(0=5|𝕩)/𝕩}
Euler001BQN ← (+´(0=3|𝕩)∨(0=5|𝕩)×𝕩)
```

## 4. Make point-free

- Wow-to-smile conversion (I have no idea) ⍤ -> `⎉`
We don't need something special.

```aplj
Euler001APL ← (+/(0=3|⊢)∨(0=5|⊢)⊢⍤/⊢)
Euler001BQN ← (+´(0=3|⊢)∨(0=5|⊢)×⊢)
```

Note: now the outermost `{}` was substituted to `()`.

## 5. Simplify APL version

```apl
Euler001APL ← (+/(0=3|⊢)∨(0=5|⊢)×⊢)
Euler001BQN ← (+´(0=3|⊢)∨(0=5|⊢)×⊢)
```
Now they are idential but the last summation.

## 6. Move the last function as a combined function

- functional combination: `.` -> `∘` (join)

```apl
Euler001APL ← ((0=3|⊢)∨(0=5|⊢)+.×⊢)
Euler001BQN ← ((0=3|⊢)∨(0=5|⊢)+∘×⊢)
```

## 7. (subsub problem) Merge common sub-expressions

- Outer product?: `∘.` -> `⌜`

```apl
Euler001APL__ ← 3 5 ∘.(0=⊣|⊢) ⍳9
Euler001BQN__ ← 3‿5 (0=⊣|⊢)⌜ (1+↕9)
```

## 8. (sub-problem) E-combinator to simple one

```apl
Euler001APL_ ← ∨⌿3 5 ∘.(0=|) ⍳9
Euler001BQN_ ← ∨˝3‿5 (0=|)⌜ (1+↕9)
```

## x. Back to the problem, get off the train

Since the conversion failed due to some rule on train, I need lambda.

```apl
Euler001APL ← ((∨⌿3 5 ∘.(0=|)⊢)+.\×⊢) ⍳9
Euler001BQN ← {𝕩×(∨˝)3‿5 (0=|)⌜𝕩} (1+↕9)
```

## So roll back to 6. Not make a bitmaps but filtered sequences.

```apl
    Euler001BQN_ ← ∨˝3‿5 (0=|)⌜ (1+↕9)
┌─                     
╵ 1 0 0 1 0 0 1 0 0 1  
  1 0 0 0 0 1 0 0 0 0  
                          ┘
    Euler001BQN__ ← 3‿5 (⊢×0=|)⌜ ↕9
┌─                   
╵ 0 0 0 3 0 0 6 0 0  
  0 0 0 0 0 5 0 0 0  
                        ┘
```

So, we can take a train.

```apl
     3‿5 (+˝)∘((⊢×0=|)⌜) ↕9
⟨ 0 0 0 3 0 5 6 0 0 ⟩|))
```

So here's the final solution.
```apl
    Euler001BQN ← (+˝)∘((⊢×0=|)⌜)
    3‿5 Euler001BQN 1+↕9
⟨ 0 0 3 0 5 6 0 0 9 ⟩
```

Yay.
