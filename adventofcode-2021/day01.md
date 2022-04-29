# Advent of Code 2021 Day 1の他の実装と比べよう

ー https://www.youtube.com/watch?v=ek1yjc9sSag

基本的には同じ。

part 2だと3つのリストから行列経由で一つのリストを作っている：

```apl
{(¯2⊸↓)∘↕ + 1⊸↓(¯1⊸↓)∘↕𝕩 + 2⊸↓∘↕𝕩} 12
```

これはwindow関数↕を呼ぶだけ。

```apl
•Show 3↕↕ 12
```
