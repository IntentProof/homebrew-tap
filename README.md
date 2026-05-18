# IntentProof Homebrew Tap

This repository publishes Homebrew formulae for IntentProof command-line tools.

Artifacts are built and signed by the canonical `intentproof-tools` GitHub
Release workflow. Formula updates are opened by automation after a release.

## Install

```bash
brew tap IntentProof/tap
brew install intentproof
brew install intentproof-verify
```

Each formula verifies the downloaded GitHub Release artifact with Cosign before
installing the binary.
