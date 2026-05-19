# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.8"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_arm64.tar.gz"
      sha256 "8300afaf02d8d3646589371ed50e5aa3c04a284d3c9a103060688f676d63dd08"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_arm64.tar.gz.sig"
        sha256 "e5f54578917436a1682bb96b78573ada4a0ddd27fa2be5d84935d35816d1db68"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_arm64.tar.gz.sigstore.json"
        sha256 "f8ac2fc3b07255728f23aac4ca03f2c284bf015d6d0778a00140fcfee60e1ae3"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_amd64.tar.gz"
      sha256 "5769d8af6ac639debcaad773dcd95ccfd284a833a303a02ccf1569f3f5c930d5"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_amd64.tar.gz.sig"
        sha256 "3d60a96035a61b50f9a7a83169cccfd12d45e5be93fde452bfc358d07bb67099"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof_0.0.0-release-dryrun.8_darwin_amd64.tar.gz.sigstore.json"
        sha256 "41ee85798c3f600c50d01fa883029db6291b8d65ddb7e280f88abb02db00e2eb"
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
