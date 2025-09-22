# Discord

## Unstable license files hash and `updpkgsums` / `pkgctl version upgrade` bug requiring manual action on PKGBUILD upgrade

The license files included in the PKGBUILD's source array have an [unstable hash which changes each time the files are fetched](https://gitlab.archlinux.org/archlinux/packaging/packages/discord/-/issues/2), preventing package rebuilds.  
As such, we set the checksum to `SKIP` for those.

However, due to [an `updpkgsums` bug](https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119) overwriting checksum entries that are set to `SKIP` (which also occurs when using `pkgctl version upgrade`), the checksum for the license files have to *manually* be set back to `SKIP` on version upgrade when using either `updpkgsums` or `pkgctl version upgrade`.
