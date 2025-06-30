# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=run-parts
pkgver=5.23.1
pkgrel=1
pkgdesc='run scripts or programs in a directory'
arch=('x86_64')
url='https://packages.qa.debian.org/d/debianutils.html'
license=('GPL')
depends=('glibc')
makedepends=('po4a')
source=("http://deb.debian.org/debian/pool/main/d/debianutils/debianutils_${pkgver}.tar.xz")
sha256sums=('206c669cbf431da30904d4f9e69d049cb711714f5c137b66bf0b1f66d58710bc')

prepare() {
  cd "$srcdir/debianutils"

  autoreconf -fi
}

build() {
  cd "$srcdir/debianutils"

  ./configure --prefix=/usr
  make run-parts
  make -C po4a
}

package() {
  cd "$srcdir/debianutils"

  install -D -m0755 run-parts "${pkgdir}/usr/bin/run-parts"
  install -D -m0644 run-parts.8 "${pkgdir}/usr/share/man/man8/run-parts.8"
  for MAN in $(find po4a/ -name run-parts.8); do
   install -D -m644  "${MAN}" "$pkgdir/usr/share/man/${MAN:5:2}/man8/run-parts.8"
  done
}
