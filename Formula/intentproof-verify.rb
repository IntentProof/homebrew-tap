# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class IntentproofVerify < Formula
  include IntentproofFormulaHelpers

  desc "IntentProof offline verifier command-line tool"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.8"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_arm64.tar.gz"
      sha256 "dbca9c2c037830569295fe8ee7df6e76ae6f43fa176ad427e3f8da26c07dd67d"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_arm64.tar.gz.sig"
        sha256 "b7b098fc124151c9b5940a7831b6f2db44aa680b6731a39b4f1fc470d54394ac"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_arm64.tar.gz.sigstore.json"
        sha256 "2ab36e5494e8cc33f56edbee22e9bf80ffba80f53b5bd82b37cd18f47bbbdbe9"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_amd64.tar.gz"
      sha256 "be29937c40524710a59e2f02822c24fa8f2855ec1633511f6ed8a76a11161939"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_amd64.tar.gz.sig"
        sha256 "c3be3005ef602e41f98d19cfdc1f057fd63b7aec8378df6f009c8a1439ece3ca"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.8/intentproof-verify_0.0.0-release-dryrun.8_darwin_amd64.tar.gz.sigstore.json"
        sha256 "917839fa42e4ca0fe6a7b5b44bf3d86df10894f6c96b60b62fa2ff9e7ef12496"
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
