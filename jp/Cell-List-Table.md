# Lists, Tables, Units, Rank, and so on in JP.

Haskellを使ったことがあれば、APLはなんだpoint free化必須言語というような捉え方でいいと思う(だからblockなんて堕落だwww簡単になりすぎるwww)。
ただしそれで実際に使ってみると目玉の「行列」というのも他の言語での配列とはまた違っていて、生成、写像、分解、操作などの基本操作一式が理解できてないと
全然先に進めない（APLで行列が使えないというのはSmalltalkでclass browserを開いたことがないというようなレベルだな）。
どうも20関数くらいは全て頭の中に入れないとこの壁を越えることはできないようだ。
ということで現在苦戦中の行列に関して日本語でまとめることにした。

では、まず作るところから。

## 生成

- https://mlochbaum.github.io/BQN/doc/map.html#table

#### 二つのリストから`≍`でtableを構成する

```apl
  1‿2 ≍ 3‿4‿5
```

ちゃんとtableになっているかどうかを確かめるには`=`の返値が2であることを見ればよい。
ちなみにリストのリストは深さが2で次元が2なのではない。
だからstrandをネストさせてもtableにはならない。

#### 二つのリストの外積`𝔽⌜`として生成する

- https://mlochbaum.github.io/BQN/doc/map.html#table

## adding

- https://mlochbaum.github.io/BQN/doc/join.html

tableに要素を追加する、すなわちHaskellでの`a -> [a] -> [a]`がやりたいなら`∾`を使う。
これは要素が左引数なら先頭に追加し、右引数なら最後に追加する。

## metrics

| metrics     | symbol  | key |                    |
|:------------|:-------:|:---:|--------------------|
| 次元(rank)  |    =    |  =  | 外積で増えていく   |
| 長さ(length)|    ≠    | \=  |                    |
| 深さ(depth) |    ≡    | \m  | ネストで増えていく |
| 形状(shape) |    ≢    | \M  | リストで返ってくる |

## indexing

- https://mlochbaum.github.io/BQN/doc/indices.html

⊏⊑を使う。二つ組を処理したいなら

```APL
{𝕗(0⊏𝕨)⋄𝕘(1⊏𝕨)}
```

## filtering

- https://mlochbaum.github.io/BQN/doc/replicate.html

`\`はそれぞれの要素の個数を指定するので要素の有無指定以上のことができる。
ただしフィルタリング関数でピックアップするのはarray-orientedではないのかもしれない。

## folding

- https://mlochbaum.github.io/BQN/doc/fold.html#insert

 `𝔽˝`はリストにしか使えない`𝔽´`を一般化したもの。

これで次元が一つ落ちるので引数がリストなら結果はスカラーになる。
しかし2次元なものを潰したいならさらにもう1回foldすることが必要になる。

また2次元配列を対象だとするとこれは各列を行方向に渡って潰したものになる。
もし各行で列方向を潰したいなら、二つ目の軸を指定することが必要になるので、
```
𝔽¨˘
```
となる。

### mapping

- https://mlochbaum.github.io/BQN/doc/map.html#mapping-modifiers

リストと同じく`𝔽¨`が使える。
