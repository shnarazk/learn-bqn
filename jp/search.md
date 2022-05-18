# Search something

## あるフィールドが最大(最小)のindexを探すMaxAt

とりあえず計算コストは考えないことにする。

1. キーを抜き出す
1. 最大値を`⌈´`で探す
1. 最大値のindexを`⊒`で探す
1. `index⊑𝕩`を返す

```apl
MaxAt ← { keyIndex F list:
  m ← ⌈˝ (keyIndex⊸⊑)¨ list
  m⊑list
}
```

簡略化の試み

```apl
MaxAt ← {keyIndex F 𝕩: {⊢⊑˜⌈˝(keyIndex⊸⊑)¨} 𝕩}
```

うまくいったもの：

```apl
  MaxAt ← {(⌈´⊸(⊑⊒˜)𝕨⊸⊑¨𝕩)⊑𝕩}
  0 MaxAt ⟨5‿3, 0‿5, 2‿1, 13‿0, 8‿2⟩
⟨ 13 0 ⟩
  1 MaxAt ⟨5‿3, 0‿5, 2‿1, 13‿0, 8‿2⟩
⟨ 0 5 ⟩
```
