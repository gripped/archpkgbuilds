# libfilezilla

## Sources handling

Upstream purposely made their download link unstable (to prevent [infrastructure abuses](https://trac.filezilla-project.org/ticket/13159#comment:1)), meaning fetches sources directly from upstream in the PKGBUILD is not possible anymore.  
An [upstream ticket was opened](https://trac.filezilla-project.org/ticket/13186) to discuss eventual solutions. In the mean time, sources are downloaded and uploaded manually to <https://sources.archlinux.org> and fetched from there in the PKGBUILD.

## Soname changes on new releases

`libfilezilla` has soname changes on new releases, requiring `filezilla` to be rebuilt against said new releases.
