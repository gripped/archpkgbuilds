# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver
pkgver=24.4.4
pkgrel=2
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs"
arch=(x86_64)
url="https://github.com/intel/media-driver/"
license=(MIT BSD-3-Clause)
depends=(gcc-libs intel-gmmlib libva)
makedepends=(cmake)
source=(${url}/archive/${pkgname%-*}-${pkgver}.tar.gz
       '010-intel-media-driver-fix-segfault-in-newer-gpus.patch'::'https://github.com/intel/media-driver/commit/7faa3bfe1a4cb79180eae64ccb426af5102f11e3.patch')
sha256sums=('3000723faf4dc56eb8276f402c4aa798459bbce860b408a0c480d863b28130ed'
            'fec5c3b6671c4345b6c280b02851bd3ba1e35321e87673b305e9a1afff5f3b6a')

prepare() {
    patch -d ${pkgname#*-}-${pkgname%-*}-${pkgver} -Np1 -i "${srcdir}/010-intel-media-driver-fix-segfault-in-newer-gpus.patch"
}

build() {
  cmake -B build -S ${pkgname#*-}-${pkgname%-*}-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DINSTALL_DRIVER_SYSCONF=OFF \
    -DMEDIA_BUILD_FATAL_WARNINGS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${pkgname#*-}-${pkgname%-*}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
