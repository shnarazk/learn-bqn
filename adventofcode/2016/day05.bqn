#!/usr/bin/env bqn
⟨StartsWith⟩ ← •Import "../lib.bqn"
CallMd5 ← { ¯1↓1⊑ •SH "md5"‿"-qs"‿𝕩 }
# IsPassword ← ("00000"˙⊸StartsWith˜)
IsPassword ← {𝕩 StartsWith "00000"}
    •Show CallMd5 "abc3231929"
    •Show IsPassword CallMd5 "abc3231929"
    •Show CallMd5 "abc5017308"
key ← "wtnhxymk"
# Input ← {𝕨 ∾¯5⊸↑"00000"⊸∾•Repr 𝕩}
Input ← {key∾•Repr 𝕩}
Md5 ← (CallMd5∘Input)
# # Part 1: #####################################
•Show Md5 0
•Show IsPassword⊸/ Md5¨ ↕1000000 
# # Part 2: #####################################
