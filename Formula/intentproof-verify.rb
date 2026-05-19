# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.7"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_arm64.tar.gz"
      sha256 "832467ace2e0e26a97fa2c357de730d1a95735b5bcd6f60c0dc93b6aafb72622"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_arm64.tar.gz.sig"
        sha256 "81e1cc5e7501f5296951e7eeb5b426ad4e3e32fc39fb4829a9303265c67e2ecf"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_arm64.tar.gz.sigstore.json"
        sha256 "61a6fae0c7254ff7db5cd63c2689c6b8cb7ee55f35e1ebd2e3361e39c9a8d34a"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_amd64.tar.gz"
      sha256 "55ae8ffa9c5a93d1ba86ac3d73425804154c7ab9e2f145f18926616317a9e551"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_amd64.tar.gz.sig"
        sha256 "f6da688ed526cca7ada4c90e5f7516280a55fd7a0ab1911b88e26fb9abd3d0d1"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof-verify_0.0.0-release-dryrun.7_darwin_amd64.tar.gz.sigstore.json"
        sha256 "a0e16cb702177e6cb6fcd3fa607b97e2b31c25b59d6207d5c230c299e4a584b0"
      end
    end
  end

  def install
    verify_intentproof_artifact!
    bin.install "intentproof-verify"
  end

  test do
    assert_match "Usage of intentproof-verify", shell_output("#{bin}/intentproof-verify --help 2>&1", 1)
  end
end
