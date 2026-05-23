# IntentProof Homebrew Tap

Homebrew formulae for IntentProof command-line tools.

## Who uses this

macOS users who install `intentproof` and `intentproof-verify` from signed
GitHub Release artifacts via Homebrew.

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

## Verify

Homebrew runs Cosign verification during `brew install`. To verify a release
artifact manually, see
[`counterparty-verification.md`](https://github.com/IntentProof/intentproof-tools/blob/main/docs/counterparty-verification.md).

## Test

Maintainers validate formula syntax and install paths locally before merging
automation PRs. Report install regressions via GitHub Issues.

## Release

Formula bumps track tagged releases from
[`intentproof-tools`](https://github.com/IntentProof/intentproof-tools).
Maintainer automation opens PRs in this repository after each release.

## Documentation hub

Per-repo README files plus
[`intentproof-infra`](https://github.com/IntentProof/intentproof-infra) for
self-host install and image verification. Docs site deferred — see
[`docs-hub-decision.md`](https://github.com/IntentProof/intentproof-infra/blob/main/docs/docs-hub-decision.md).

## Support

Report formula and install issues via
[GitHub Issues](https://github.com/IntentProof/homebrew-tap/issues).
See [`CONTRIBUTING.md`](CONTRIBUTING.md). Security reports:
[`SECURITY.md`](SECURITY.md).

## License

Apache License 2.0 — see [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and
[`TRADEMARK.md`](TRADEMARK.md).
