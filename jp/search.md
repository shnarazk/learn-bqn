# Search something

## あるフィールドが最大(最小)のindexを探す

とりあえず計算コストは考えないことにする。

1. キーを抜き出す
1. 最大値を`⌈´`で探す
1. 最大値のindexを`⊏`で探す

```apl
findRecordWithMaxField ← { keyIndex F list:
  m ← ⌈˝ (keyIndex⊸⊑)¨ list
  m⊑list
}
```

```apl
findRecordWithMaxField ← {keyIndex F 𝕩: {⊢⊑˜⌈˝(keyIndex⊸⊑)¨} 𝕩}
```

```apl
findRecordWithMaxField ← {⊢⊑˜⌈˝(⊣⊸⊑)¨}
findRecordWithMaxField ← ⊢⊑˜⌈˝(⊣⊸⊑)¨
```
