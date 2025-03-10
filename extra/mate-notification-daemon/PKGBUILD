# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-notification-daemon
pkgver=1.28.1
pkgrel=1
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
sha256sums=('b532d9562b448286465975b5a6dfeeba60977217ae402bc2f6854650a9a5de33')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
                --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir="/usr/lib/${pkgname}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
