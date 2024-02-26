# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=remmina
epoch=1
pkgver=1.4.35
pkgrel=1
pkgdesc="remote desktop client written in GTK+"
url="https://www.remmina.org/"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('avahi' 'libgcrypt' 'libssh' 'vte3' 'libsodium' 'libayatana-appindicator' 'libsoup3')
makedepends=('cmake' 'freerdp' 'libvncserver' 'spice-gtk' 'spice-protocol'
             'harfbuzz' 'xorgproto' 'gobject-introspection' 'kwallet5'
             'webkit2gtk-4.1' 'gtk-vnc' 'ninja' 'curl' 'openssl')
optdepends=('freerdp: RDP plugin'
            'libsecret: Secret plugin'
            'libvncserver: VNC plugin'
            'spice-gtk: Spice plugin'
#            'pyhoca-cli: X2Go plugin'
            'webkit2gtk-4.1: WWW plugin'
            'gtk-vnc: GVNC plugin'
            'kwallet5: kwallet plugin'
            'gnome-terminal: external tools')
replaces=('remmina-plugins')
provides=('remmina-plugins')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/Remmina/Remmina/-/archive/v${pkgver/rc/-rc}/Remmina-v${pkgver/rc/-rc}.tar.bz2")
sha512sums=('36dc419b4473c71f6b3e53338f4a3cf7a1fe60534ea0dce375b4c9fd00cd9d8a618c4376be4d031bdee1eed8b4aade4538a6cc414629ef6dde41cdcd513a6d36')

build() {
  cmake -S Remmina-v${pkgver/rc/-rc} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON \
    -DWITH_NEWS=OFF \
    -DWITH_KF5WALLET=ON \
    -DWITH_X2GO=ON \
    -DWITH_GVNC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
