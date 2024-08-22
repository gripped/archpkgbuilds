# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=sleuthkit
pkgver=4.12.1
pkgrel=3
pkgdesc='File system and media management forensic analysis tools'
arch=('x86_64')
url="https://www.sleuthkit.org/sleuthkit"
license=(
  'CPL-1.0'
  'GPL-2.0-or-later'
  'IPL-1.0'
)
depends=(
  'gcc-libs'
  'glibc'
  'libewf'
  'perl'
  'sqlite'
  'zlib'
)
provides=('libtsk.so')
changelog=$pkgname.changelog
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('6b2de0baabc6a38429a33993114ca3820329b477d5038cbf45fcf69fca8addfd'
            'SKIP')
validpgpkeys=('0917A7EE58A9308B13D3963338AD602EC7454C8B') # Brian Carrier <carrier@sleuthkit.org>

build() {
  cd ${pkgname}-${pkgver}
  # From upstream's bootstrap script
  aclocal \
    && (libtoolize --force || glibtoolize --force) \
    && automake --foreign --add-missing --copy \
    && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
}
