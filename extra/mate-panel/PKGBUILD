# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-panel
pkgver=1.28.6
pkgrel=1
pkgdesc="The MATE Panel"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=('dbus-glib' 'libwnck3' 'libcanberra' 'libmateweather' 'libsm' 'mate-menus' 'mate-desktop' 'gettext' 'gtk-layer-shell' 'dconf-editor')
makedepends=('itstool' 'git' 'glib2-devel' 'gobject-introspection' 'mate-common' 'yelp-tools' 'autoconf-archive')
groups=('mate')
conflicts=('mate-panel-gtk3')
replaces=('mate-panel-gtk3')
source=("git+https://github.com/mate-desktop/mate-panel.git#tag=v${pkgver}"
        git+https://github.com/mate-desktop/mate-submodules.git)
sha256sums=('d93ee9265547a624b35784d0c15bdf35ecaef2c5f14904a624c612efc0b9cece'
            'SKIP')
prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.mate-submodules.url "${srcdir}/mate-submodules"
    git -c protocol.file.allow=always submodule update
    ./autogen.sh
}

build() {
    cd "${pkgname}" 
    ./configure \
                --prefix=/usr \
                --libexecdir="/usr/lib/${pkgname}" \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --enable-introspection
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
