# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=glslang
pkgver=1.4.335.0
pkgrel=1
epoch=1
pkgdesc="OpenGL and OpenGL ES shader front end and validator"
url="https://github.com/KhronosGroup/glslang"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('gcc-libs' 'spirv-tools')
makedepends=('cmake' 'ninja' 'spirv-headers' 'python' 'git')
options=('staticlibs')
source=("git+${url}.git#tag=vulkan-sdk-${pkgver}")
sha256sums=('262eaf3026bcc5f75b608cc1bb593a0b4f199fdf5006cfe3335e18d0407906f4')

build() {
  cd "${pkgname}"

  # we need fat LTO objects to not break consumers during linking
  CXXFLAGS+=" -ffat-lto-objects"
  cmake \
    -Bbuild-static \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -DALLOW_EXTERNAL_SPIRV_TOOLS='ON' \
    -DBUILD_SHARED_LIBS='OFF'
  cmake --build build-static

  cmake \
    -Bbuild-shared \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -DALLOW_EXTERNAL_SPIRV_TOOLS='ON' \
    -DBUILD_SHARED_LIBS='ON' \
    -DGLSLANG_TESTS='ON'
  cmake --build build-shared
}

check() {
  cd "${pkgname}"

  ninja -Cbuild-shared test
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" cmake --install build-static
  DESTDIR="${pkgdir}" cmake --install build-shared

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/lib"
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
}

# vim: ts=2 sw=2 et:
