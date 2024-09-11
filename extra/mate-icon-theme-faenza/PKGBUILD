# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-icon-theme-faenza
pkgver=1.20.0
pkgrel=4
pkgdesc="Faenza icon theme for MATE"
url="https://mate-desktop.org"
arch=('any')
license=('GPL-3.0-only')
makedepends=('mate-common')
groups=('mate-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop-legacy-archive/mate-icon-theme-faenza/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3e838a08c18116d4d69fcacf50b456d79846db12bf249b44c7d971cf2df7b9c0')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
