# Maintainer: Sébastien Luttringer
# Contributer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=lksctp-tools
pkgver=1.0.20
pkgrel=1
pkgdesc='An implementation of the SCTP protocol'
arch=('x86_64')
url='https://github.com/sctp/lksctp-tools'
license=('GPL-2.0-or-later' 'LGPL-2.1-only')
makedepends=('git')
depends=('glibc' 'bash')
source=("git+https://github.com/sctp/lksctp-tools.git#tag=v$pkgver")
sha256sums=('91c118f63d53d00b4f5eae9277aace9d9a52fdee5025ae4789abd675f47388eb')

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname/src/func_tests
  make v4test
  make v6test
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
