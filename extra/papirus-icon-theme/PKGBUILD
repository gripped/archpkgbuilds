# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20250501
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL-3.0")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0eca50c296a548733d9cb97f0d9b62cac99d6b1bb473bf016e33188986334b9fc84bc0682e9a6e5339d3d247f2cfefd24a1de3f901de9ffbc9e8a7ad1b5d39f8')
options+=(!strip)

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
