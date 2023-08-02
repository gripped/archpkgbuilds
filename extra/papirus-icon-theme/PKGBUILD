# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20230801
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1924a83fd2b4d3aab3c9858e86132276501648e273d15ff5023a4e9174cffbb078a6a4592267babefecfe6544346cdeede7fa68afaebd225476a1898fe1d614e')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
