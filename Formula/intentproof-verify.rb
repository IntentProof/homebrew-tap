# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.5"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_arm64.tar.gz"
      sha256 "c2267d059e3f3e808bb161476096b47e4f1e88c4d8dbf30c19cdbd3523fc4f36"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_arm64.tar.gz.sig"
        sha256 "2de365fe74fa5d756614a3a36308be38609e619eee2cde9074b03a6bf5ae6515"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_arm64.tar.gz.sigstore.json"
        sha256 "dec5bb4f99e7e3c606d59bc8928d460d25d9fb156aae3e082c748a4ec518f001"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_amd64.tar.gz"
      sha256 "85f071adb6665f72734de422118927ec75952fe80a9bccb62091c8d6987ee755"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_amd64.tar.gz.sig"
        sha256 "87294401ef844af92f960eeb4d1c6ab7ef9f8cc985120bca1778c4fdd26ca738"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.5/intentproof-verify_0.0.0-release-dryrun.5_darwin_amd64.tar.gz.sigstore.json"
        sha256 "6fccbd2000660f7a55642bdb26b86347c9c5bef19cb3cd7697626ec5b52bc589"
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
