# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-notification-daemon
pkgver=1.28.0
pkgrel=2
provides=('notification-daemon')
pkgdesc="Notification daemon for MATE"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
groups=('mate')
depends=('libcanberra' 'libwnck3' 'libnotify' 'gettext' 'mate-panel')
makedepends=('autoconf-archive' 'glib2-devel' 'mate-common' 'python')
conflicts=('mate-notification-daemon-gtk3')
replaces=('mate-notification-daemon-gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/mate-notification-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b86fa78d3c34851328c494aa374450ca8fe7a13c22e6f6154c5d503197662545')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
                --prefix=/usr \
                --libexecdir="/usr/lib/${pkgname}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
