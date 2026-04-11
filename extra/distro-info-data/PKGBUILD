# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info-data
pkgver=0.67
pkgrel=1
pkgdesc="Information about all releases of Debian and Ubuntu (data files)"
arch=('any')
url="https://salsa.debian.org/debian/distro-info-data"
license=('ISC')
makedepends=('git')
checkdepends=('python')
options=(!emptydirs)
source=("git+https://salsa.debian.org/debian/distro-info-data.git#tag=debian/$pkgver")
sha256sums=('79d1abaef78de642d71792758f56030f9bc1dfa4b593df8f8c1b553d2174b15a')

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
