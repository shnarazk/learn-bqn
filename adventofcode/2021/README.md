# Advent of Code 2021 in BQN

- https://github.com/shnarazk/advent-of-code

## Memo

### (day2) `Encode`の中で何故 `> 𝕩`をローカル変数として定義できない？

https://mlochbaum.github.io/BQN/try.html#code=RiDihpAgewogIHRlbXAg4oaQIDAKICDwnZWpID0gMSA/IHRlbXAgKyAxOwogIHRlbXAg4oaQIDAKICB0ZW1wICsgMgp9CkYgMA==

`;`はブロックの途中でreturnするものではなく、そこでブロックが終っている。
関数が複数回定義されていると思った方がよい。

```apl
F ← {
  temp ← 0
  𝕩 = 1 ? temp + 1;
  temp ← 0        # 2重定義にならない
  temp + 2
}
```

See https://mlochbaum.github.io/BQN/doc/block.html#multiple-bodies

