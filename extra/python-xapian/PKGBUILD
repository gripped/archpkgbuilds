# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgname=python-xapian
_name=xapian-bindings
pkgver=1.4.27
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
sha512sums=('ca7195329500aebe96a4dd0ecee4b8357e790fd798dddd0d13fe2d5e901a8fb09e3e56b3661ebec5dac57ee8c4ff3d36beb97c39d440899f0284c845b0edef87'
            'SKIP')
b2sums=('ea4b5698a4a5c428f3304b430188505fd67ff04bcace369d3ea822eda53c1b39a2e2a2a383a3b39632a92732e54bccd3cdc600f028df19b69d6b7274e75b3475'
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
