# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: DsTr <dstr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=winetricks
pkgver=20230212
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='https://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('x86_64')
depends=('cabextract' 'perl' 'unzip' 'xorg-xmessage')
optdepends=('zenity: GUI for GNOME desktop'
            'kdialog: GUI for KDE desktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Winetricks/winetricks/archive/$pkgver.tar.gz")
sha512sums=('3d2211091754a2a254d5ac8dab27d59d488d512149d8060828cf9d69df96f5ccad183f2ba9f2172452a2ae322236e86e7fce560836a2bc05dc9a36c2a422f245')

package() {
  depends+=('wine')

  cd winetricks-$pkgver
  make DESTDIR="$pkgdir" install
}
