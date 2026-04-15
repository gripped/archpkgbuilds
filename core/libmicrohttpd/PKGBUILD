# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Norberto Lopes <shelika@mail.telepac.pt>
# Contributor: Kao Dome <kaodome@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: Mathias Rohnstock <linksoft@gmx.de>

pkgname=libmicrohttpd
pkgver=1.0.4
pkgrel=1
pkgdesc='a small C library that is supposed to make it easy to run an HTTP server as part of another application.'
arch=('x86_64')
url='https://www.gnu.org/software/libmicrohttpd/'
license=('LGPL')
depends=('gnutls')
checkdepends=('curl')
provides=('libmicrohttpd.so')
validpgpkeys=('EA812DBEFA5A7EF17DA8F2C1460A317C3326D2AE'  # Evgeny Grin (Karlson2k) <k2k@yandex.ru>
              'D8423BCB326C7907033929C7939E6BE1E29FC3CC') # Christian Grothoff <christian.grothoff@bfh.ch>
source=("https://ftp.gnu.org/gnu/libmicrohttpd/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('d72e5cfccd62bf2f79252edbc3828eeedc088ce71fc47b7c9e3bd7246b3d54de'
            'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '/^LIB_VERSION_REVISION=/c LIB_VERSION_REVISION=4' configure.ac
  sed -i '/Project-Id-Version:/s|1.0.3|1.0.4|' po/libmicrohttpd.pot
  sed -i '/MHD_VERSION/s|0x01000300|0x01000400|' src/include/microhttpd.h

  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-dependency-tracking \
    --disable-examples \
    --enable-curl \
    --enable-https \
    --enable-largefile \
    --enable-messages \
    --with-pic
  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
