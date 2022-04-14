#!/usr/bin/env bqn
# input ← ⟨199, 200, 208, 210, 200, 207, 240, 269, 260, 263⟩
lines ← •FLines "data/2021/input-day01.txt"
input ← •BQN¨ lines
# •Show input
•Show +´{(0⊸⊏𝕩)<(1⊸⊏𝕩)}˘(2⊸↕) input
•Show +´{(0⊸⊏𝕩)<(1⊸⊏𝕩)}˘(2⊸↕)+´˘3↕ input
