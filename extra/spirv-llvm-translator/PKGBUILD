# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_srcname=SPIRV-LLVM-Translator
pkgname=${_srcname,,}
pkgver=20.1.4
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(LicenseRef-custom)
depends=(gcc-libs glibc llvm-libs spirv-tools)
makedepends=(git cmake llvm spirv-headers)
checkdepends=(python clang)
source=(git+${url}.git#tag=v$pkgver)
sha256sums=('902641ccb6e00116b93fb446ed93bab75e8aa923072daf91b4f52060bbe3df6a')

pkgver() {
  git -C ${_srcname} describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
  cmake -B build -S ${_srcname} \
    -G 'Unix Makefiles' \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_INCLUDE_TESTS=ON \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
    -Wno-dev
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${_srcname}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
