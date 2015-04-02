CA Certificates / SSL Certificates
==================================

## What's here?

A list of bad certificates categorized in three severity level.

Each certificate is named with its SHA1 fingerprint, in `.pem` format.

### Definition of Severity Level

- [High](Severity.High.txt)
  - Any certificates that have been used for man-in-the-middle attack
  - CA certificates that have high risk of being used for attack.
- [Medium](Severity.Medium.txt)
  - Self-signed CA certificates that have high risk of being used for attack.
  - CA certificates that have low risk of being used for attack.
- [Low](Severity.Low.txt)
  - All other certificates from the Greater China

### Hunman Readable Certificates Details

- [Severity.High.md](Severity.High.md)
- [Severity.Medium.md](Severity.Medium.md)
- [Severity.Low.md](Severity.Low.md)

## How do I add a certificate?

1. Put a `.pem` version in this folder.
2. Run `./rehash.sh` to rename the newly added `.pem` to its SHA1 fingerprint.
3. Define its severity by put its SHA1 fingerprint into one of the severity list.
2. Run `./rehash.sh` to regenerate the hunman readable certificates details.
