# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20231201
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('49c9ef429ba5368d40c996aa84576bb4b7585291398c76ef13c969df19aaa4108ccc4691aed7881a7121cdc79b20f87caf3aa146cf8f0d353096506dce889faa')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
