# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgname=python-xapian
_name=xapian-bindings
pkgver=2.0.0
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
sha512sums=('30815f95bc3133fb29ee71651ed10ac27b6436732de39cdf49166a8255bf6ca9e9001fcc827cc8354079add11af05fd045d993865165fd381251c5d4eabcfa21'
            'SKIP')
b2sums=('16f97a5b86c3f07d3891238bce3d479ca7ebf7dfeb611893495399a9cc5106d288e51a09e702817b2379fc3d8849fcddb7ec1227b9dfe311700c7face997e93c'
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
