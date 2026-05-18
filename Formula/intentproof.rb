# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.3"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_arm64.tar.gz"
      sha256 "90848f27625c93101b9fab206055ae361ad37e68c042498a01409f635a612809"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_arm64.tar.gz.sig"
        sha256 "dcf0aad3d851593c8ff41f2e43faef843789155ce84aa7c5473d68c72239f0d6"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_arm64.tar.gz.sigstore.json"
        sha256 "6a38e5f336878de80ef4328624eb1057240747163638f2f978ba83e16788ba63"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_amd64.tar.gz"
      sha256 "47c8b7f973a8e7d627b1fec49ebf026b173f3a1cc3661cde0acd4e3ed1a8e3c3"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_amd64.tar.gz.sig"
        sha256 "4d17f5c9cbfae1f57edbced2f15c5ed605eacfdacb83f605621694e7fec9a529"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.3/intentproof_0.0.0-release-dryrun.3_darwin_amd64.tar.gz.sigstore.json"
        sha256 "b5fee454695ab4277aad72b8760f2a3c2876664e735f2f4b18aff8d17b46edcb"
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
