#!/usr/bin/env bqn
⟨For, ParseInts, StartsWith⟩ ← •Import "../lib.bqn"
Decode ← {
    x ← 𝕩
    lpi‿rpi ← x ⊐ '('‿')'
    {
        lpi = rpi ? ⟨rpi, ""⟩;
        ⟨0, (1+rpi)↓x⟩
    }
}
# Part 1: #####################################
# Eval ← { }
example ← ⟨
    "ADVENT"
    "A(1x5)BC"
    "(3x3)XYZ"
    "A(2x2)BCD(2x2)EFG"
    "(6x1)(1x3)A"
    "X(8x2)(3x3)ABCY"
⟩
# example ← ⥊ •FLines "../../data/2016/input-day09.txt"
•Show ≍⟜(Decode¨) example
# •Show screen Eval´⌽ Decode¨ example
# •Show +´'#'=¨ ⥊ screen Eval´⌽ Decode¨ example
# •Show +´'#'=¨ ⥊ screen Eval´⌽ Decode¨ ⥊ •FLines "../../data/2016/input-day09.txt"

# Part 2: #####################################
