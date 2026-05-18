# typed: strict
# frozen_string_literal: true

# Shared Cosign verification helper for IntentProof formulae.
module IntentproofFormulaHelpers
  INTENTPROOF_CERT_IDENTITY_REGEXP = "https://github.com/IntentProof/intentproof-tools/"
  INTENTPROOF_OIDC_ISSUER = "https://token.actions.githubusercontent.com"

  def verify_intentproof_artifact!
    system "cosign", "verify-blob",
           "--certificate-identity-regexp", INTENTPROOF_CERT_IDENTITY_REGEXP,
           "--certificate-oidc-issuer", INTENTPROOF_OIDC_ISSUER,
           "--bundle", resource("sigstore").cached_download,
           "--signature", resource("signature").cached_download,
           cached_download
  end
end
