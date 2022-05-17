#!/usr/bin/env cbqn
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
Decode ← { F x:
    lpi‿rpi ← x ⊐ '('‿')'
    {
        lpi = rpi ? ⟨rpi, ""⟩;
        ⟨n, m⟩ ← ParseInts lpi↓rpi↑x
        post ← ⊑Decode (1+n+rpi)↓x
        ⟨post+lpi+n×m, (1+n+rpi)↓x⟩
    }
}
example ← ⟨
    0‿""
    6‿"ADVENT"
    7‿"A(1x5)BC"
    9‿"(3x3)XYZ"
    11‿"A(2x2)BCD(2x2)EFG"
    6‿"(6x1)(1x3)A"
    18‿"X(8x2)(3x3)ABCY"
⟩
•Show ≍⟜((Decode(1⊸⊑))¨) example
# Part 1: #####################################
Decode1 ← { F x:
    lpi‿rpi ← x ⊐ '('‿')'
    {
        lpi = rpi ? rpi;
        ⟨n, m⟩ ← ParseInts lpi↓rpi↑x
        post ← Decode1 (1+n+rpi)↓x
        post+lpi+n×m
    }
}
•Show +´ Decode1¨ ⥊ •FLines "../../data/2016/input-day09.txt"
# Part 2: #####################################
Decode2 ← { k F x:
    lpi‿rpi ← x ⊐ '('‿')'
    {
        lpi = rpi ? k×rpi;
        ⟨n, m⟩ ← ParseInts lpi↓rpi↑x
        target ← (k×m) Decode2 n↑(1+rpi)↓x
        post ← k Decode2 (1+n+rpi)↓x
        post+target
    }
}
•Show +´ {1 Decode2 𝕩}¨ ⥊ •FLines "../../data/2016/input-day09.txt"
