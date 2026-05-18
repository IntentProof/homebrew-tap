# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.3"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_arm64.tar.gz"
      sha256 "f95eefb1923f129ae398cd46c81cb8bf523f6e438ccdfef7a2b4f49a585fdad8"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_arm64.tar.gz.sig"
        sha256 "41aa3f53e2d2932f8ff5fd0c57ff5657a5b58e8ef3ccd53677f18253bca47649"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_arm64.tar.gz.sigstore.json"
        sha256 "e27e351f5af43b844b36160aa36e647e75250a0ccdb886e0980407b5760626a2"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_amd64.tar.gz"
      sha256 "739b71ff0f671f0db7dc4a31d766c43732b49363637635bd85a389b906e36338"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_amd64.tar.gz.sig"
        sha256 "bbf7bf6a6ea1368b53bbc4b2c3e3c388f7008b384ab3b8896a9c0c153dd1b41b"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof-verify_0.0.0-release-dryrun.3_darwin_amd64.tar.gz.sigstore.json"
        sha256 "f2687278781694b1d9b58d83030accaa0df9a90eef8c72ac5cb8bbbae87d9498"
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
