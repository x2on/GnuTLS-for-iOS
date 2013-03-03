This is a tutorial for using self-compiled builds of the GnuTLS-library for iOS. You can build apps with XCode and the official SDK from Apple with this. I also made a small example-app for using the libraries with XCode and the iPhone/iPhone-Simulator.

@see: http://www.x2on.de/2011/02/01/gnutls-for-ios-iphone-and-ipad/

Enjoy GnuTLS on the iPhone!

Checkout the submodules:
```bash
git submodule init
git submodule update
```

Build the libraries:
```bash
./build-all.sh
```

The examples uses the MD5-algorithm to calculate an md5 from an UITextfield.

## Changelog:

2013-03-03: iOS 6.1 compatibility, Move libgcrypt to submodule, GnuTLS 2.12.23

2013-01-01: iOS 6.0 compatibility

2012-05-29: Updated GnuTLS to 2.12.19, iOS 5.1 compatibility

2011-11-20: Updated GnuTLS to 2.12.14 (excluding PCKS#11 support) build with iOS SDK 5.0

2011-03-27: Updated GnuTLS to 2.12.0: Force using libgcrypt

2011-03-19: Updated GnuTLS to 2.10.5: Patch needed from http://permalink.gmane.org/gmane.comp.encryption.gpg.gnutls.devel/4825

2011-02-01: Updated GnuTLS to 2.10.4: Patch needed from http://permalink.gmane.org/gmane.comp.encryption.gpg.gnutls.devel/4825



