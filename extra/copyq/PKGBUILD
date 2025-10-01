# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Batou <batou at cryptolab net>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq
pkgver=12.0.1
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'qt6-wayland' 'knotifications' 'kstatusnotifieritem')
makedepends=('extra-cmake-modules' 'qt6-tools')
license=('GPL3')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('452cd2acbe9d70e0b93bef413620dfece363f0595b19788d71035c8455d6097f')

build() {
    cmake -B build -S CopyQ-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
