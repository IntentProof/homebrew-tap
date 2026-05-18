# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.5"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_arm64.tar.gz"
      sha256 "61d478bdaa82c636cbd5e4780223d7776b1e984792ae37a801746dae439f2092"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_arm64.tar.gz.sig"
        sha256 "e77ab9527df158140f5617dea06c86238d59ec300485c4c6e5944b4a2837f72a"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_arm64.tar.gz.sigstore.json"
        sha256 "7b038748a9c9a42268605426e6e83f38dd9378226ab0142878a49b2b722eae8b"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_amd64.tar.gz"
      sha256 "12dc7df7f71702fc33b7d96ffc2baa7074a47bebbdceacc9c4db33d808cf6415"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_amd64.tar.gz.sig"
        sha256 "10feb6d3e292ab739b589b6c4c5c8334c5146279ecbaae131884edb6ea069e4f"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof_0.0.0-release-dryrun.5_darwin_amd64.tar.gz.sigstore.json"
        sha256 "0ab695e8d42e4cc1bcf70d68e3fbc45b9a00c73c627c5f726b4fef572eb74654"
      end
    end
  end

  def install
    verify_intentproof_artifact!
    bin.install "intentproof"
  end

  test do
    assert_match "Usage: intentproof <command>", shell_output("#{bin}/intentproof 2>&1", 1)
  end
end
