# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Batou <batou at cryptolab net>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq
pkgver=13.0.0
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/hluk/${pkgname}"
depends=('hicolor-icon-theme' 'qt6-svg' 'knotifications' 'kstatusnotifieritem' 'kguiaddons' 'libxtst')
makedepends=('extra-cmake-modules' 'qt6-tools' 'vulkan-headers')
license=('GPL-3.0-or-later')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "https://github.com/hluk/CopyQ/pull/3268.patch")
sha256sums=('c7e0c9aa95b5653dee547f168d58cf5aae4f66ad5f94856a61741ebe9527ad72'
            'efac74b7dabc5b69d72d679bb23ed679feef945576c3ec6a4a46d4d3846e4beb')

prepare() {
    cd CopyQ-$pkgver
    patch -p1 -i "$srcdir/3268.patch"
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
