# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers
pkgver=1.3.261.1
pkgrel=1
arch=(x86_64)
pkgdesc="Vulkan Validation Layers (32-bit)"
url="https://www.khronos.org/vulkan/"
license=('custom')
depends=('lib32-gcc-libs' 'lib32-vulkan-icd-loader' 'vulkan-headers')
makedepends=('cmake' 'python' 'lib32-libx11' 'lib32-libxrandr' 'lib32-wayland' 'git')
options=('!lto' '!strip') # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=("https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/sdk-${pkgver}.tar.gz")
sha256sums=('1372d522f297bb3fb386802b1aa4b7f885a9e1e969a6a3c6e9b29d381357f21d')

prepare() {
  cd "${srcdir}"/Vulkan-ValidationLayers*

  rm -rf build && mkdir build
}

build() {
  export ASFLAGS=--32
  export CFLAGS+=" -m32 -ffat-lto-objects"
  export CXXFLAGS+=" -m32 -ffat-lto-objects -Wno-error=restrict"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig" 

  cd "${srcdir}"/Vulkan-ValidationLayers*/build

  ../scripts/update_deps.py --config release
  cmake -C helper.cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_INSTALL_DATADIR=/share \
    -DCMAKE_SKIP_RPATH=True \
    -DBUILD_TESTS=Off \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "${srcdir}"/Vulkan-ValidationLayers*/build
  
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/share/vulkan

  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}
