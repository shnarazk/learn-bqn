# Advent of Code 2021 Day 1の他の実装と比べよう

## [AoC 2021 Day 1 using Ivy](https://www.youtube.com/watch?v=ek1yjc9sSag) by Russ Cox

基本的には同じ。

part 2だと3つのリストから行列経由で一つのリストを作っている：

```apl
{(¯2⊸↓)∘↕ + 1⊸↓(¯1⊸↓)∘↕𝕩 + 2⊸↓∘↕𝕩} 12
```

これはwindow関数`↕`を呼ぶだけ。

```apl
•Show 3↕ ↕12
─
╵ 0  1  2
  1  2  3
  2  3  4
  3  4  5
  4  5  6
  5  6  7
  6  7  8
  7  8  9
  8  9 10
  9 10 11
           ┘
```
 ## [Advent of Code 2021 in APL #1!](https://www.youtube.com/watch?v=DNYxfoCEVEM) by code_report
