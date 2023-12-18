# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-media
pkgver=1.26.1
pkgrel=1
url="https://mate-desktop.org"
pkgdesc="MATE Media Tools"
arch=('x86_64')
license=('GPL')
depends=('libcanberra' 'libmatemixer' 'mate-desktop' 'mate-panel' 'gettext')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
groups=('mate-extra')
conflicts=('mate-media-gtk3')
replaces=('mate-media-gtk3')
sha256sums=('28b2a21a296d915c7c06d9d216f49a8541cd3cec895b3259bca068a85e26eb0b')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
                --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir=/usr/lib/${pkgname} \
                --localstatedir=/var
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
