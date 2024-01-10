# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver
pkgver=24.1.1
pkgrel=1
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs"
arch=(x86_64)
url="https://github.com/intel/media-driver/"
license=(MIT BSD)
depends=(gcc-libs intel-gmmlib libva)
makedepends=(cmake)
source=(${url}/archive/${pkgname%-*}-${pkgver}.tar.gz)
sha256sums=('da90f3c38176936f6315bb4b0f04f6f83080f9a6a228294538aa6befe9ce20e0')

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
