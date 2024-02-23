# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2023.6
# There was no release tag, just the release candidate
_tag="${pkgver}.rc1"
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (32-bit)"
arch=('x86_64')
url="https://www.khronos.org/vulkan/"
license=('Apache-2.0')
depends=('lib32-gcc-libs' 'spirv-tools')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${_tag}.tar.gz")
sha256sums=('750e4bfcaccd636fb04dd912b668a8a6d29940f8f83b7d9a266170b1023a1a89')

build() {
  cd "SPIRV-Tools-${_tag}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib32 \
      -DCMAKE_BUILD_TYPE=None \
      -DSPIRV_WERROR=Off \
      -DBUILD_SHARED_LIBS=ON \
      -DSPIRV_TOOLS_BUILD_STATIC=OFF \
      -DSPIRV-Headers_SOURCE_DIR=/usr
  cmake --build build
}

check() {
  cd "SPIRV-Tools-${_tag}"
  ninja -C build test
}

package() {
  cd "SPIRV-Tools-${_tag}"

  DESTDIR="${pkgdir}" cmake --install build
  rm -r "${pkgdir}"/usr/{bin,include}
}
