# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=spirv-headers
epoch=1
pkgver=1.4.304.1
pkgrel=1
pkgdesc="SPIR-V Headers"
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=('MIT')
makedepends=('cmake')
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/vulkan-sdk-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5d9210e32e4bad681951646857afa59698455618c79713eb5a98f785317ca2965b9640f1fce3e1ca6650e847a4a74688d12ebc2b5943f336df0163feea67acc2')

build() {
  cmake -B build \
    -S SPIRV-Headers-vulkan-sdk-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 SPIRV-Headers-vulkan-sdk-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
