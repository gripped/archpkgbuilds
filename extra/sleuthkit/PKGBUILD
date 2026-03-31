# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=sleuthkit
pkgver=4.14.0
pkgrel=2
pkgdesc='File system and media management forensic analysis tools'
arch=('x86_64')
url="https://www.sleuthkit.org/sleuthkit"
license=(
  'CPL-1.0'
  'GPL-2.0-or-later'
  'IPL-1.0'
)
depends=(
  'glibc'
  'libewf'
  'libgcc'
  'libstdc++'
  'openssl'
  'perl'
  'sqlite'
  'zlib'
)
provides=('libtsk.so')
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('3bf3bb8c399f2597f1dc928e514185cb498dcd4f447815975ec7e6c8f56f5d6cf27c1a056e96b55de829ad205dbf27fab645d91f64995a7099bf8e02322169fb'
        'SKIP')
validpgpkeys=('0917A7EE58A9308B13D3963338AD602EC7454C8B') # Brian Carrier <carrier@sleuthkit.org>

build() {
  cd ${pkgname}-${pkgver}
  export CFLAGS+=" -std=gnu17"
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
