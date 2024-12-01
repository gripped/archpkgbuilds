# filezilla

## Sources handling

Upstream purposely made their download link unstable (to prevent [infrastructure abuses](https://trac.filezilla-project.org/ticket/13159#comment:1)), meaning fetches sources from directly upstream in the PKGBUILD is not possible anymore.  
An [upstream ticket was opened](https://trac.filezilla-project.org/ticket/13186) to discuss eventual solutions. In the mean time, sources are downloaded and uploaded manually to <https://sources.archlinux.org> and fetched from there in the PKGBUILD.
