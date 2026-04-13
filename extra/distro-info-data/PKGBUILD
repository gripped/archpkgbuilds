# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info-data
pkgver=0.68
pkgrel=1
pkgdesc="Information about all releases of Debian and Ubuntu (data files)"
arch=('any')
url="https://salsa.debian.org/debian/distro-info-data"
license=('ISC')
makedepends=('git')
checkdepends=('python')
options=(!emptydirs)
source=("git+https://salsa.debian.org/debian/distro-info-data.git#tag=debian/$pkgver")
sha256sums=('b77e71e04c2c601abc519f86bd44f824085c202af8ee6fcefffe7acb1469a8f3')

check() {
  cd $pkgname
  make test
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}

# vim:set ts=2 sw=2 et:
