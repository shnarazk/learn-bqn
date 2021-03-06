# Learn BQN

- https://github.com/mlochbaum/BQN
- https://bqnpad.mechanize.systems
- APL
  - [The Array Cast](https://www.arraycast.com/) on [Apple podacst](https://podcasts.apple.com/jp/podcast/the-array-cast/id1568833451)

### pi

- https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/e9e3959cd2d0ec735e7a6a1917df784842b76706)

```apl
4×+´÷(1-˜2×0+`|¨)⊸×(1-2×2⊸|) ↕10000
```

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/fdafa8bd24ce2b6fd518a3cf253ad1ef409388a6)

```apl
        # Make the increasing seqence
        ×´˘(0‿1‿2⊸ +)˘∘‿3 ⥊ 3 / ((2⊸×) (1⊸+↕6))
⟨ 24 120 336 720 1320 2184 ⟩
        # Make the signed sequence
         ×⟜(×`¯1˙¨) ((×´˘(0‿1‿2⊸ +)˘ ∘(∘‿3 ⊸ ⥊) ∘(3⊸ /)∘ (2⊸×))) (1⊸+↕6)
⟨ ¯24 120 ¯336 720 ¯1320 2184 ⟩
        # Make terms and Sum them up
        3++´¯4⊸÷×⟜(×`¯1˙¨) ((×´˘(0‿1‿2⊸ +)˘ ∘(∘‿3 ⊸ ⥊) ∘(3⊸ /)∘ (2⊸×))) (1⊸+↕10)
3.1414067184965018
        # And make it a pure train (failed to shorten)
        (3⊸+)∘(+´)∘(¯4⊸÷×⟜(×`¯1˙¨))∘(×´˘(0‿1‿2⊸+)˘∘(∘‿3⊸⥊)∘(3⊸/)∘(2⊸×)) (1⊸+↕1000)
3.141592653340542
```

### Escape sequence

```apl
#!/usr/bin/env bqn

# esc ← ' ' - 5 # I do not know how to encode it as literal
esc ← @ + 13
•Out esc∾"[0;38;5;9mred"
```
