#!/usr/bin/env bqn
⟨StartsWith⟩ ← •Import "../lib.bqn"
Md5 ← { ¯1↓1⊑ •SH "md5"‿"-qs"‿𝕩 }
# IsPassword ← ("00000"˙⊸StartsWith˜)
IsPassword ← {𝕩 StartsWith "00000"}
•Show Md5 "abc3231929"
•Show IsPassword Md5 "abc3231929"
•Show Md5 "abc5017308"
key ← "wtnhxymk"
Input ← {𝕨 ∾¯5⊸↑"00000"⊸∾•Repr 𝕩 }
# # Part 1: #####################################
•Show Md5 key Input 0
•Show IsPassword⊸/ (Md5∘key⊸Input)¨ ↕1000000 
# # Part 2: #####################################
# total ← 1
# Propagate2 ← { F pn:
#     len ← ≠pn
#     target ← ⊑ (<1)⊒˜(pn⊸Unpropagated)¨ ↕len
#     {
#         (target < len) ?
#             # •Show "Fire "‿target
#             ⟨lo, hi⟩ ← target⊑network
#             ⟨mi, ma⟩ ← 1↓target⊑pn
#             pn ↩ 0˙⌾(⊑target⊸⊑) pn
#             {
#                 0  ≤ lo ? pn ↩ ⟨mi, lo⟩ SetToken pn;
#                 ¯3 ≤ lo ? total×↩mi;
#                 @
#             }
#             {
#                 0  ≤ hi ? pn ↩ ⟨ma, hi⟩ SetToken pn;
#                 ¯3 ≤ hi ? total×↩ma;
#                 @
#             }
#             F pn
#         ;
#             pn
#     }
# }
# petri2 ← Propagate2 (0‿¯∞‿¯∞˙¨ ↕220) DecodeSetToken´ insts
# •Show total
