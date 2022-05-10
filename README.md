# SlimPerl
A Perl package suitable for current Logitech Media Server versions running on ARM7 based Synology DiskStations.

Synology's official Perl, currently offered in version 5.28.3) is not suitable to run
[Logitech Media Server](https://downloads.slimdevices.com/nightly/index.php?ver=8.2) -- a number of modules
remain unresolved. Since I could not get this workig I decided to take the plunge an compile it myself using
[Perl-Cross](https://github.com/arsv/perl-cross).

Up to DSM6 I used a Debian chroot environment packaged as SPK to run the stock Linux debian LMS. With DSM7 this
is no longer an option since SPK cannot use root anymore, so I went for a more compliant option with a supporting Perl
package and LMS.

# Requirements

* Linux x86 machine for compilation
* [Synology Cross Development](https://github.com/SynologyOpenSource/pkgscripts-ng)
* An ARM7 based DiskStation running DSM7

# Prepare

Unpack and organize repos like so:
```
somewhere/
├── pkgscripts-ng/
└── source/
    └── SlimPerl
```

You need to prepare the cross development environment:

```
cd somewhere/pkgscripts-ng/
git checout -b DSM7.0 origin/DSM7.0
sudo ./EnvDeploy -v 7.0 -p armada375
```

You also need this little patch to stop the build script from reporting a bogus build error:
```
--- a/include/errors.py
+++ b/include/errors.py
@@ -15,7 +15,7 @@ LOG_DIR = '/logs'
 # "error_pattern": skip_list
 BUILD_ERROR_CHECKLIST = {
     "line.*syntax error": [],
-    "Error": ['ignored', 'Error\.[c|o|h|cc|lo|Plo|js]', 'GPG Error', 'distclean'],
+    "Error": ['ignored', 'Error\.[c|o|h|cc|lo|Plo|js|pm]', 'GPG Error', 'distclean'],
     "fatal error": [],
     "missing separator": [],
     "No rule to make target": ["clean", "distclean"],
```

Download sources:
```
cd somewhere/source/SlimPerl
./download.sh
```

# Build

```
cd somewhere/pkgscripts-ng/
sudo ./PkgCreate.py -p aramada375 SlimPerl
```
