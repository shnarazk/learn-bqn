https://adventofcode.com/

# I need a library

- [x] namespace https://mlochbaum.github.io/BQN/doc/namespace.html
- [ ] unit test

- `startsWith` as an alternative to regex
- `ParseInts`; it's essential.
- Control flow https://mlochbaum.github.io/BQN/doc/control.html

```apl
If      β {πβπ@}Β΄                 # Also Repeat
IfElse  β {cβΏTβΏF: cβΆFβΏT@}
While   β {π©{π½βπΎβπ½_π£_πΎβπ½βπΎπ©}π¨@}Β΄  # While 1βΏ{... to run forever
DoWhile β {π@ β While π¨βΏπ©}Β΄
For     β {IβΏCβΏPβΏA: I@ β Whileβ¨C,PβAβ©}
Match   β {ππ¨}Β΄
Select  β {(βπ©)βΆ(1βπ©)@}
Switch β {cββπ© β aβΏmβ<ΛβββΏ2β₯1βπ© β (βaβΈβ<c)βΆm@}
Test    β {fnβ{CβΏAπe:CβΆAβΏE}Β΄π©βFn@}

StartsWith β { (β π¨) < (β π©) ? 0 ; 0 = (<Λ(β π©)βπ¨) ββββ< π© }
ParseInts β {
  IsNum β { (('0' β€ π©) β§ (π© β€ '9')) β¨ ('-' = π©) }
  Build β { w F 1: { w β€ 0 ? -w; w }; w F 0: { 0 < w ? Β―1-w; w } }
  β’BQNΒ¨ π© βΛ 1- Λ0βΈ<βΈΓ Β―1 Build` IsNumΒ¨ π©
}
```
