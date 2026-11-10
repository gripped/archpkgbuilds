# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=openpace
pkgver=1.1.4
pkgrel=3
pkgdesc="Cryptographic library for EAC version 2"
arch=(x86_64)
url="https://frankmorgner.github.io/openpace"
license=(GPL-3.0-or-later GPL-3.0-linking-exception)
depends=(
  openssl
)
makedepends=(
  gengetopt
  git
  help2man
)
provides=(
  libeac.so
)
source=("git+https://github.com/frankmorgner/openpace.git#tag=${pkgver}")
sha256sums=('6d4eddae736f169ff0666e54e533953f4a62a5721da21879117e24861961ee99')

prepare() {
  cd $pkgname

  # Fix build failure with OpenSSL 4
  git cherry-pick -n 40a5181b6abff751f756be980bfa165eb02677be

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/bin/{example,eactest} "$pkgdir"/usr/share/doc/openpace/
}
