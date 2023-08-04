# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2022.4
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (32-bit)"
arch=('x86_64')
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('lib32-gcc-libs' 'spirv-tools')
makedepends=('cmake' 'python' 'git' 'ninja' 'spirv-headers')
source=("git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd SPIRV-Tools

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
  ninja -C build
}

check() {
  cd SPIRV-Tools
  ninja -C build test
}

package() {
  cd SPIRV-Tools

  DESTDIR="${pkgdir}" ninja -C build install
  rm -r "${pkgdir}"/usr/{bin,include}

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
