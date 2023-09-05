# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: DsTr <dstr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=winetricks
pkgver=20220521
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='https://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('x86_64')
depends=('cabextract' 'perl' 'unzip' 'xorg-xmessage')
optdepends=('zenity: GUI for GNOME desktop'
            'kdialog: GUI for KDE desktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Winetricks/winetricks/archive/$pkgver.tar.gz")
sha512sums=('e0a20f255fe46c2bcda32731288cb0e8a6294057e308087b621b8e082252c2532411e3bb0ee6807a7f47b1ebdffc6641509b89c4a6f889fa9fba94773641201c')

package() {
  depends+=('wine')

  cd winetricks-$pkgver
  make DESTDIR="$pkgdir" install
}
