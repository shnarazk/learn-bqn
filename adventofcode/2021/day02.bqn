#!/usr/bin/env bqn

StartsWith ← { (≠𝕨) < (≠𝕩) ? 0 ; 0 = (<˘(≠𝕩)↕𝕨) ⊑∘⊐⟜< 𝕩 }
Encode ← {
    ((> 𝕩) StartsWith "forward") ? 'F'‿(•BQN 7↓(> 𝕩));
    ((> 𝕩) StartsWith "down"   ) ? 'D'‿(•BQN 5↓(> 𝕩));
    ((> 𝕩) StartsWith "up"     ) ? 'U'‿(•BQN 3↓(> 𝕩));
    '?'‿0
}

input ← ⟨
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2",
⟩

•Show input
# •Show (⊑ input) StartsWith "forward "
orders ← (<Encode)˘ input
•Show orders
Move ← {
    'D' = (⊑𝕨) ? (⊑𝕩)       ‿ ((1⊑𝕩)+(1⊑𝕨));
    'U' = (⊑𝕨) ? (⊑𝕩)       ‿ ((1⊑𝕩)-(1⊑𝕨));
    'F' = (⊑𝕨) ? (⊑𝕩+(1⊑𝕨)) ‿ (1⊑𝕩);
    𝕨‿𝕩 ! 0
}
•Show ×´ 0‿0 Move´ ⌽ orders
•Show ×´ 0‿0 Move´ ⌽ (<Encode)˘ •FLines "../data/2021/input-day02.txt"
