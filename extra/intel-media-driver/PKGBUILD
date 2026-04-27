# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver
pkgver=26.1.5
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI — Broadwell+ iGPUs'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('BSD-3-Clause' 'MIT')
depends=(
    'glibc'
    'intel-gmmlib'
    'libgcc'
    'libstdc++'
    'libva')
makedepends=(
    'cmake')
source=("https://github.com/intel/media-driver/archive/intel-media-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c56899fecc003d047ce6afbdf471851512e0ceac66c2ef22ac36f1e6ce46170c')

build() {
    cmake -B build -S "media-driver-intel-media-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -DMEDIA_BUILD_FATAL_WARNINGS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "media-driver-intel-media-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
