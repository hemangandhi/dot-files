# Wat?

Nix's chief weapon is reproducibility, reproducibility and reliability... reliability and reproducibility, nix's two weapons are reliability and reproducibility, and the ability to temporarily install packages... nix's three weapons are reliability and reproducibility, and the ability to temporarily install packages... and a pure functional programming language. Nix's four... no... amongst Nix's weaponry our such elements as reliability, reproducibility... I'll come in again.

# What is this?

This directory has a bunch of things I'll install temporarily for projects/tasks that:

1. aren't their own Github repos
1. are their own Git repos, but shared with non-Nix people.

## Things

| Thing | How to get | Notes |
| --- | --- | --- |
| Rust | `nix-shell $THIS_DIR/rust.nix` | This is the quick-n-dirty version |
| Rustup | `nix-shell $THIS_DIR/rustup.nix` | This helps deal with other non-nix people's versions of Rust things |
| Editing sheet music | `nix-shell -p lilypad` | |
| OBS Studio | `nix-shell $THIS_DIR/obs-studio.nix` | Be sure to `nvidia-offload` |
