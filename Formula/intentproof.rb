# frozen_string_literal: true

require_relative "../lib/intentproof_formula_helpers"

class Intentproof < Formula
  include IntentproofFormulaHelpers

  desc "Local loop command-line tool for signed execution proofs"
  homepage "https://github.com/IntentProof/intentproof-tools"
  version "0.0.0-release-dryrun.7"
  license "Apache-2.0"

  depends_on "cosign" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_arm64.tar.gz"
      sha256 "ad4e3820fbf37dda09c9d8fc117e5e63e439e1e7cfc5275e30a2bd86f560c66d"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_arm64.tar.gz.sig"
        sha256 "4d1c74b17f4057143b1ba72df92b7d606d13271d760f93f1e967a4c325ba61fe"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_arm64.tar.gz.sigstore.json"
        sha256 "90f9892fdbb793eef557395343a735a45c441f7d78424b9e00442c08957ab1e3"
      end
    end

    on_intel do
      url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_amd64.tar.gz"
      sha256 "cf5786c67f3a289cd51617629f381286a13375b1a6ecd2f969e99f0abe798781"

      resource "signature" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_amd64.tar.gz.sig"
        sha256 "ac2875623d36a20c2911188d47b16402f2f9767bd22037cc774c758302b77f6f"
      end

      resource "sigstore" do
        url "https://github.com/IntentProof/intentproof-tools/releases/download/v0.0.0-release-dryrun.7/intentproof_0.0.0-release-dryrun.7_darwin_amd64.tar.gz.sigstore.json"
        sha256 "b5dfaa897cac2bdd2942bd2b4631474cb273b59dd37f557f32b082717cdc10d1"
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
