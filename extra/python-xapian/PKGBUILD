# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgname=python-xapian
_name=xapian-bindings
pkgver=1.4.29
pkgrel=2
epoch=1
pkgdesc="Python bindings for Xapian"
arch=(x86_64)
url="https://xapian.org/docs/bindings/python/"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  python-sphinx
  "xapian-core=$epoch:$pkgver"
)
source=(https://oligarchy.co.uk/xapian/$pkgver/$_name-$pkgver.tar.xz{,.asc})
sha512sums=('54735a30971a108d2e23c07229aab29d4f898368de5b04fc08331e82b1e9a52fa7425150aa7aef05428a2b3c65757e83148f4077423a9847eb04e1a7fb05fe34'
            'SKIP')
b2sums=('8bcfefb3e2c933223dd681874999905324c910d47a3260814a2bd9e97b3685b51c9828496db1a8275bf3da6fedf4727b173c69bfbe36dc458a1aa17eb47eb551'
        'SKIP')
validpgpkeys=('08E2400FF7FE8FEDE3ACB52818147B073BAD2B07') # Olly Betts <olly@debian.org>

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  cd $_name-$pkgver
  ./configure --prefix=/usr --with-python3
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_name-$pkgver
  make check
}

package() {
  depends+=(
    xapian-core libxapian.so
  )

  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,ChangeLog,HACKING,NEWS,README,TODO} -t "$pkgdir/usr/share/doc/$_name"
}
# vim:set ts=2 sw=2 et:
