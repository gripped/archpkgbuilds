# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Batou <batou at cryptolab net>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq
pkgver=12.0.0
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'qt6-wayland' 'knotifications' 'kstatusnotifieritem')
makedepends=('extra-cmake-modules' 'qt6-tools')
license=('GPL3')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0e30b24fd2955cbbee6d380b3ee04aeebc54cebd4d790b58de1367f56eeeb703')

build() {
    cmake -B build -S CopyQ-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
