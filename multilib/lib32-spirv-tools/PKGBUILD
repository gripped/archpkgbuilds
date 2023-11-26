# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2023.5
# There was no release tag, just the release candidate
_tag="${pkgver}.rc1"
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (32-bit)"
arch=('x86_64')
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('lib32-gcc-libs' 'spirv-tools')
makedepends=('cmake' 'python' 'ninja' 'spirv-headers')
source=("spirv-tools-${pkgver}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v${_tag}.tar.gz")
sha256sums=('aed90b51ce884ce3ac267acec75e785ee743a1e1fd294c25be33b49c5804d77c')

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
  ninja -C build
}

check() {
  cd "SPIRV-Tools-${_tag}"
  ninja -C build test
}

package() {
  cd "SPIRV-Tools-${_tag}"

  DESTDIR="${pkgdir}" ninja -C build install
  rm -r "${pkgdir}"/usr/{bin,include}

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
