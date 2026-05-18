# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.2"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_arm64.tar.gz"
      sha256 "3439357a85aa7bb4fc662e355dfd63348232e8482f48ac147fad8acc7cc7caba"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_arm64.tar.gz.sig"
        sha256 "24baa0f0eaf7d2e9108b42e22ffecc4a8ff4a24b6aec52118b7c806a33eac947"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_arm64.tar.gz.sigstore.json"
        sha256 "061b85430ef65fab8e2c2ab319e5e050f662d2df3d40e9f376030d54558d730f"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_amd64.tar.gz"
      sha256 "c619027efe81177823333c1b62e85a0b3bbf94ba1b7aefad7fccb7ffc195510d"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_amd64.tar.gz.sig"
        sha256 "ac53cb8147dd734b730af4bc1b4de316444b865c444095566871fe7a248e8f99"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.2/intentproof_0.0.0-release-dryrun.2_darwin_amd64.tar.gz.sigstore.json"
        sha256 "5c8b9f3e3cccb6919564750e2fd765cf5b27d9635f0a43c4e59501428bf6a170"
      end
    end
  end

  def install
    verify_intentproof_artifact!
    bin.install "intentproof"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/intentproof --help")
  end
end
