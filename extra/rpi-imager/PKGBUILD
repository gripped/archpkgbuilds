# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.9.5
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=(
    'curl'
    'gcc-libs'
    'glibc'
    'gnutls'
    'hicolor-icon-theme'
    'libarchive'
    'qt6-base'
    'qt6-declarative'
    'xz'
)
optdepends=(
    'dosfstools: SD card bootloader support'
    'udisks2: Needed if you want to be able to run rpi-imager as a regular user'
)
makedepends=(
    'git'
    'cmake'
    'qt6-tools'
    'qt6-svg'
)
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache-2.0")

source=("git+https://github.com/raspberrypi/rpi-imager.git#tag=v${pkgver}"
        "remove-vendoring.patch")

b2sums=('5f417ddee37b088dd99694a379c876401f8de5991376738650cdbc67e6e891f427dcc541e88d60c01a7ca85a295c80518caa7c9bae7a215bc2d4933832d40458'
        '37abc1887dc3c2b8b9600de0088715924144fd4f38bd794e391589b58358166a51bd0c539e8bf1f8816073587c77c345556272a88c640927866b529ed9822c93')

prepare() {
    # https://github.com/raspberrypi/rpi-imager/issues/924
    patch -Np1 -d "${pkgname}" -i "$srcdir/remove-vendoring.patch"
}

build() {
    cmake -B build -S "${pkgname}/src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_CHECK_VERSION=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 ${srcdir}/${pkgname}/doc/man/rpi-imager.1 "${pkgdir}/usr/share/man/man1/rpi-imager.1"
    install -Dm644 ${srcdir}/${pkgname}/debian/changelog "${pkgdir}/usr/share/doc/rpi-imager/changelog"
    install -Dm644 ${srcdir}/${pkgname}/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
