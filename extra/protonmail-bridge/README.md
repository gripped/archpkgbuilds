# protonmail-bridge

## Upstream pre-releases

Some upstream releases are tagged as "Pre-release" in the GitHub upstream repository and should not be packaged (as they are not considered "stable" by upstream).  
See, for instance: <https://github.com/ProtonMail/proton-bridge/releases/tag/v3.13.0>

Make sure to verify that new upstream releases are not tagged as "Pre-release" before packaging them.  
Note that such "pre-releases" are filtered out in the nvchecker integration (as it specifically looks for releases tagged as "latest").

## Tests failing if a protonmail-bridge instance is already running in the check() environment

`protonmail-bridge` tests are expecting ports 1143 & 1144 (default and fallback ports for IMAP) and ports 1025 & 1026 (default and fallback ports for SMTP) to be free for some specific tests scenarios.  
If those ports are already in use by any other service(s) (e.g. there's already a running protonmail-bridge instance on those default ports in your build / test env), tests will fail.

A simple solution is to use offloaded builds.
