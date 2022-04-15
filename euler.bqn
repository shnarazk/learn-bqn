#!/usr/bin/env bqn

# Euler001BQN ← {+´(0=3|⊢)∨(0=5|⊢)⊢/⊢}
Euler001BQN = (+˝)∘((⊢×0=|)⌜)
•Show Euler001BQN ↕10
