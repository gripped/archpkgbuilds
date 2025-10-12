# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Batou <batou at cryptolab net>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq
pkgver=12.0.1
pkgrel=3
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'knotifications' 'kstatusnotifieritem' 'libxtst')
makedepends=('extra-cmake-modules' 'qt6-tools')
license=('GPL-3.0-or-later')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    'https://github.com/hluk/CopyQ/pull/3243.patch')
sha256sums=('452cd2acbe9d70e0b93bef413620dfece363f0595b19788d71035c8455d6097f'
            '5a1b9faecdd14cd30ddf8122a610ff6ae2f39586234343b1b4e3f7952850672d')

prepare() {
    cd CopyQ-$pkgver
    patch -p1 -i "$srcdir/3243.patch"
}

build() {
    cmake -B build -S CopyQ-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
