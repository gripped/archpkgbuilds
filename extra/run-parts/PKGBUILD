# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=run-parts
pkgver=5.23.2
pkgrel=1
pkgdesc='run scripts or programs in a directory'
arch=('x86_64')
url='https://salsa.debian.org/debian/debianutils'
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'po4a')
validpgpkeys=('B3131A451DBFDF7CA05B4197054BBB9F7D806442') # Niels Thykier <niels@thykier.net>
source=("git+https://salsa.debian.org/debian/debianutils.git#tag=debian/${pkgver}?signed")
sha256sums=('24eeb1c6632149c02a9a4ee096aaa10dedaa955010b0809c3b1eab51a4dd4889')

prepare() {
  cd 'debianutils/'

  autoreconf -fi
}

build() {
  cd 'debianutils/'

  ./configure --prefix=/usr
  make run-parts
  make -C po4a
}

package() {
  cd 'debianutils/'

  install -D -m0755 run-parts "${pkgdir}/usr/bin/run-parts"
  install -D -m0644 run-parts.8 "${pkgdir}/usr/share/man/man8/run-parts.8"
  for MAN in $(find po4a/ -name run-parts.8); do
   install -D -m644  "${MAN}" "$pkgdir/usr/share/man/${MAN:5:2}/man8/run-parts.8"
  done
}
