# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=libaec
pkgver=1.1.4
pkgrel=3
pkgdesc="Adaptive Entropy Coding library"
arch=(x86_64)
url="https://gitlab.dkrz.de/k202009/libaec"
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(cmake)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
         0001-Guard-against-redefinition-of-cmake-targets.patch)
sha256sums=('cf869c166656a83857adf62a092311a0069855c6ced3446e3f090a6d52279f65'
            'b983e822f58f166bc6ffcfbd5f28efb570df3470f4bdfcf1fbe6e982b672ff6a')

prepare() {
# Avoid redefinition of cmake targets when included twice https://github.com/MathisRosenhauer/libaec/pull/46
  patch -d ${pkgname}-v${pkgver} -p1 < 0001-Guard-against-redefinition-of-cmake-targets.patch
}

build() {
  cmake -B build -S ${pkgname}-v${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_STATIC_LIBS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    ${pkgname}-v${pkgver}/LICENSE.txt
}
