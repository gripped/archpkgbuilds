# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=lowdown
pkgver=1.1.2
pkgrel=1
pkgdesc='A simple Markdown translator'
arch=('x86_64')
url='https://kristaps.bsd.lv/lowdown'
license=('ISC')
depends=('glibc' 'libmd')
makedepends=('git')
provides=('liblowdown.so')
source=("$pkgname::git+https://github.com/kristapsdz/lowdown#tag=$(echo $pkgver | sed -e 's/^/VERSION_/' -e 's/\./_/g')")
sha512sums=('4ab5fb7888ad1b08954473b2725c87548484c424bbef63515ee22ce9912a858b64571c6f8f277b4e07b6e2d11297fd15b08fe26c568df45f2e7614402c4fcbb7')
b2sums=('856a207ea593dc0b3d7b7cb49fbced5d40d176ec4a53a7853bc4a769e89015224c9c7007f272bbf2c5c6b783684b6aa0ac5e83ee5f7986f4cfc144039ab9498d')

build () {
  cd "$pkgname"

	./configure \
    PREFIX=/usr \
    MANDIR=/usr/share/man

  # ensure LDFLAGS is passed correctly
  sed -i "s/^LDFLAGS.*/LDFLAGS = $LDFLAGS/" Makefile.configure

	make
}

check () {
	make -C "$pkgname" regress
}

package () {
  cd "$pkgname"

  # package
	make DESTDIR="$pkgdir" \
    install \
    install_lib_common \
    install_shared

  # symlink unversioned to versioned shared library
  local LIBVER=$(grep "^LIBVER" Makefile | sed "s/.*= //")
  ln -sf "/usr/lib/liblowdown.so.$LIBVER" "$pkgdir/usr/lib/liblowdown.so"

  # license
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
