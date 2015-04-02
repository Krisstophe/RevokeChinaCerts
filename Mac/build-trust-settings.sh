#!/bin/bash

SOURCE_DIR=$(dirname "$0")
CERTIFICATES_DIR="$SOURCE_DIR/../Shared/Certificates"

build-trust-settings () {
  case $CERTIFICATES in
    essential)
      FINGERPRINTS=$(cat "$CERTIFICATES_DIR/Severity.High.txt")
      ;;
    strict)
      FINGERPRINTS=$(cat "$CERTIFICATES_DIR/Severity.High.txt" "$CERTIFICATES_DIR/Severity.Medium.txt" "$CERTIFICATES_DIR/Severity.Low.txt")
      ;;
    *)
      FINGERPRINTS=$(cat "$CERTIFICATES_DIR/Severity.High.txt" "$CERTIFICATES_DIR/Severity.Medium.txt")
  esac

  TrustSettings=${1:-TrustSettings.plist}
  TrustSettingsByFingerprints=$(mktemp -t TrustSettingsByFingerprints.plist.XXXXXX)

  "$SOURCE_DIR/libexec/security-trust-settings-blacklist" $FINGERPRINTS "$TrustSettingsByFingerprints"
  "$SOURCE_DIR/libexec/security-trust-settings-merge" "$TrustSettingsByFingerprints" "$TrustSettingsByIssuers" "$TrustSettings"
  /bin/rm "$TrustSettingsByFingerprints"
}

build-trust-settings "$@"

