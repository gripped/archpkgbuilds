# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=rkcommon
pkgver=1.15.2
pkgrel=1
pkgdesc='Intel RenderKit common C++/CMake infrastructure'
arch=('x86_64')
url='https://github.com/ospray/rkcommon/'
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'onetbb')
makedepends=(
    'cmake')
source=("https://github.com/ospray/rkcommon/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9128642e5187b963385dbf1655f3b143d3ef46310cc2e27114d220b347d0e2f2')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
