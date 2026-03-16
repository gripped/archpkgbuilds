# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgname=python-xapian
_name=xapian-bindings
pkgver=1.4.30
pkgrel=1
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
sha512sums=('fb48e10c01a219b34da41c2a0475f607fb0b12b5c444c06c37f16b7405905c8c113362caee409382d0ff90945b975b7c77acb2385ec82395684bdea6ff9b3926'
            'SKIP')
b2sums=('49c47eae230ff46cf169cc0fc301f3cf87f5cad7e0d47125332b8b4a3ca896a1fa7bb63c7a3bd046d645433a2c8efe8499ad4112e042d0ebef206f7e2197c681'
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
