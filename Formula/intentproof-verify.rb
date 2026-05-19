# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.9"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_arm64.tar.gz"
      sha256 "ff8cfa9220b813926b0c8ac4ddf978b3fb7c528ae674352b3b755379a81e4c2b"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_arm64.tar.gz.sig"
        sha256 "f3f3df77a8d026b806422b55ebe4996fb463880cefaf5307bec0795f5664300c"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_arm64.tar.gz.sigstore.json"
        sha256 "e89f753cdd1a2e156656061db0fcacea483c51e94f3ecd1c19d42d49e342a9f4"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_amd64.tar.gz"
      sha256 "6a9160bd1e1dfac2fbec251626fd604f5421ced3da47e73ee3d27ca093c161f5"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_amd64.tar.gz.sig"
        sha256 "33f1b31c3bd35698ed63fd571326fbac539efa6820440bfa3e263a38ae1a629b"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.9/intentproof-verify_0.0.0-release-dryrun.9_darwin_amd64.tar.gz.sigstore.json"
        sha256 "2e60ad6534c09fee4b930254c70a07d8c1085e1fd7d05ba9bfced57ac4861aff"
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
