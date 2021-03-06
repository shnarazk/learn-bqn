# Advent of Code 2021 Day 1の他の実装と比べよう

## [Advent of Code 2021 in APL #1!](https://www.youtube.com/watch?v=DNYxfoCEVEM) by code_report

基本的には同じ。と言うかこれを見ながら打ち込んだのでは。

#### part 1
1. 二つ組のリストを作る。ただしAPLの高階関数を使っている
1. 処理(大小比較、合計)する
1. train化

1はBQNならwindow関数`↕`を呼べばよい。ただしその結果は配列になるので注意。

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

#### part 2
1. 3つ組のリストを作るのだがpart 1の高階関数がそのまま使える

## [AoC 2021 Day 1 using Ivy](https://www.youtube.com/watch?v=ek1yjc9sSag) by Russ Cox

#### part 1
1. リストから先頭要素を取り除く
1. リストから最終要素を取り除く
1. 比較する
1. true要素を合計する

#### part 2
1. 3行の配列を作り、転置する
1. 各要素を合計してリストにする
1. 後は一緒

3つのリストから行列経由で一つのリストを作っている。

```apl
{(¯2⊸↓)∘↕ + 1⊸↓(¯1⊸↓)∘↕𝕩 + 2⊸↓∘↕𝕩} 12
```

なのでこちらがBQN版に対応するようだ。これ以外には特記することはなし。
