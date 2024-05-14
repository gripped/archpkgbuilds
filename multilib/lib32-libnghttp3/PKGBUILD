# Maintainer: Christian Hesse <eworm@archlinux.org>

pkgname=lib32-libnghttp3
pkgver=1.3.0
pkgrel=1
pkgdesc="HTTP/3 library written in C (32-bit)"
url='https://github.com/ngtcp2/nghttp3'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' 'libnghttp3')
provides=('libnghttp3.so')
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
source=("https://github.com/ngtcp2/nghttp3/releases/download/v${pkgver}/nghttp3-${pkgver}.tar.xz"{,.asc})
sha256sums=('450525981d302f23832b18edd1a62cf58019392ca6402408d0eb1a7f3fd92ecf'
            'SKIP')

prepare() {
  cd nghttp3-${pkgver}
  autoreconf -i
}

build() {
  cd nghttp3-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

check() {
  cd nghttp3-${pkgver}
  make check
}

package() {
  cd nghttp3-${pkgver}/lib
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/include
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
