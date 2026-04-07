# Kea

## Eventual build failures on `boost` upgrade

New `boost` upgrades may cause build failures for `kea` (see e.g. <https://gitlab.archlinux.org/archlinux/packaging/packages/kea/-/commit/ddcceb7cf51b4dd666d02a05d5e84ff17a15253e>, <https://gitlab.archlinux.org/archlinux/packaging/packages/kea/-/commit/1f90b1f6d27891c7be7f5ea74abe1f11a77b7a46> & <https://gitlab.archlinux.org/archlinux/packaging/packages/kea/-/commit/785a886707c0438f22b6a62eb0fb37e974d783ce>).

Unfortunately, `boost` sonames are not used by `kea`, meaning that sogrep won't detect it as a package to rebuild on `boost` soname bump and that it will therefore not be included in related ToDos by default (e.g. <https://archlinux.org/todo/boost-1900/>).  
`kea` should therefore ideally be added *manually* in `boost` upgrade ToDos. Patches to fix build with new `boost` releases can usually be found upstream, however they may not cleanly apply as-is (as they are not always backported to the stable branch).

## Secure permissions for `/etc/kea/*` from systemd tmpfiles.d

Specific `kea` files contain sensitive information and should therefore have restrictive / secure permissions (e.g. log and leases files, see [CVE-2025-32803](https://kb.isc.org/docs/cve-2025-32803)).

This also applies to configuration files in `/etc/kea` which may contain secret and sensitive network configuration information. As such, we are applying secure permissions to files and directories in `/etc/kea` from the systemd [tmpfiles configuration](https://gitlab.archlinux.org/archlinux/packaging/packages/kea/-/blob/main/kea.tmpfiles).  
Any eventual future addition or removal of files or directories in `/etc/kea` should be reflected in the tmpfiles configuration accordingly.
