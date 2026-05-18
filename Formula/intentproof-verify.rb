# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.2"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_arm64.tar.gz"
      sha256 "46a637016e7c3c8bad8805d1371c97b263c1e846ea4b11099c825e9fc31d637d"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_arm64.tar.gz.sig"
        sha256 "8b56ffdd7f41bf09b35489240fc7aa2a2a6e3b43d6a9cc47b0186fb72addb730"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_arm64.tar.gz.sigstore.json"
        sha256 "311c4277f08b96c91b5bdef1cddb2bc4d217ba8d85f53857bd0a26ab3f347928"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_amd64.tar.gz"
      sha256 "391059bacbb9bfe0acbf18d027a74c0e67a10ae64a1d1529be666543678e92ac"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_amd64.tar.gz.sig"
        sha256 "16e048484e75533dee8e21764c08e6f4b29d23f523f4e836ff4a6ab3d007e929"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof-verify_0.0.0-release-dryrun.2_darwin_amd64.tar.gz.sigstore.json"
        sha256 "4c984269b944611f21a6d05fafe35a46171f38817ec9bd3d3f89bffd717ba86e"
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
