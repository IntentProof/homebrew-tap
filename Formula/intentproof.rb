# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.9"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_arm64.tar.gz"
      sha256 "25ed6e72e53ccfbec6502701ae53878688c931a0b23fcd3bd7e277c4a982894e"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_arm64.tar.gz.sig"
        sha256 "bfb843595fd5540b816639f9740366c64f0876dc483387b85cad659491fdd1ba"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_arm64.tar.gz.sigstore.json"
        sha256 "919e62bca8ab8f1aa8aca5e08ba77851f5b4906f88ca13249daaf6d167970aa1"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_amd64.tar.gz"
      sha256 "7bd3ce04281cb776975afbf065c0147f71e685bea2a93324e0c10cf3f326ec15"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_amd64.tar.gz.sig"
        sha256 "9dae5857e9c9ee86c18fa5741d597b1325dfff34c6b48c1f28bf690eb8cad75a"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof_0.0.0-release-dryrun.9_darwin_amd64.tar.gz.sigstore.json"
        sha256 "53fd176229076beca31719af9b13228069ea70caee8c5b84281cfcd3a72b99de"
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
