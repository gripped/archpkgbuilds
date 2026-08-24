# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=rkcommon
pkgver=1.15.3
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
sha256sums=('31925481d189dcdddadf651dd37021108e5acaa8d39bd639de8c098157ad07b7')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
