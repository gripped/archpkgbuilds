# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2024.4.rc2
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (32-bit)"
arch=('x86_64')
url="https://www.khronos.org/vulkan/"
license=('Apache-2.0')
depends=('lib32-gcc-libs' 'spirv-tools')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b63b0ceda2350a4d097f41d52e929eddeadb8cae05b979989da364f1012727b0')

build() {
  cd "SPIRV-Tools-${pkgver}"

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
  cd "SPIRV-Tools-${pkgver}"

  ninja -C build test
}

package() {
  cd "SPIRV-Tools-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
  rm -r "${pkgdir}"/usr/{bin,include}
}
