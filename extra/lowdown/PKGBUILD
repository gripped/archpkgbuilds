# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=lowdown
pkgver=3.0.0
pkgrel=1
pkgdesc='A simple Markdown translator'
arch=(x86_64)
url='https://kristaps.bsd.lv/lowdown'
license=(ISC)
depends=(glibc libmd)
makedepends=(git bmake)
provides=(liblowdown.so)
source=("$pkgname::git+https://github.com/kristapsdz/lowdown#tag=$(echo $pkgver | sed -e 's/^/VERSION_/' -e 's/\./_/g')")
sha512sums=('e7c3af9571988bab17f281dbb12e7e46ec4eb3442479604fcb713e32fd1960d153c54e4ef35e66ebb7776617fa121b2c93f388322e87a8585e280be5ee4a045e')
b2sums=('3525068db1e12c26b081063f49b0c315ee1ab5b61cadf8330bdccea8cfb1ce4ef8181b92f73c31f5999bbbd203e34bbbcb7112c98e279c1ba8c9ae939657bd65')

build () {
  cd "$pkgname"

	./configure \
    PREFIX=/usr \
    MANDIR=/usr/share/man

  # ensure LDFLAGS is passed correctly
  sed -i "s/^LDFLAGS.*/LDFLAGS = $LDFLAGS/" Makefile.configure

	bmake
}

check () {
	bmake -C "$pkgname" regress
}

package () {
  cd "$pkgname"

  # package
	bmake DESTDIR="$pkgdir" \
    install \
    install_lib_common \
    install_shared

  # symlink unversioned to versioned shared library
  local LIBVER=$(grep "^LIBVER" Makefile | sed "s/.*= //")
  ln -sf "/usr/lib/liblowdown.so.$LIBVER" "$pkgdir/usr/lib/liblowdown.so"

  # license
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
