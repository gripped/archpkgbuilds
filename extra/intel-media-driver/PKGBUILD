# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver
pkgver=25.2.0
pkgrel=1
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs"
arch=(x86_64)
url="https://github.com/intel/media-driver/"
license=(MIT BSD-3-Clause)
depends=(gcc-libs glibc intel-gmmlib libva)
makedepends=(cmake)
source=(${url}/archive/${pkgname%-*}-${pkgver}.tar.gz)
sha256sums=('be7a1aa9341c637a6adb26164adffeffcad859980246fab4df04f3d7d8e2114b')

build() {
  cmake -B build -S ${pkgname#*-}-${pkgname%-*}-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5.0 \
    -DINSTALL_DRIVER_SYSCONF=OFF \
    -DMEDIA_BUILD_FATAL_WARNINGS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${pkgname#*-}-${pkgname%-*}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
