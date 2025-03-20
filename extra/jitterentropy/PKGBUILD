# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com
# Contributor: Timothy Redaelli <timothy.redaelli+aur@gmail.com>

pkgname=jitterentropy
_pkgname=$pkgname-library
pkgver=3.6.2
pkgrel=1
pkgdesc='Hardware RNG based on CPU timing jitter'
arch=('x86_64')
url='https://www.chronox.de/jent/'
license=('BSD-3-Clause' 'GPL-2.0-only')
depends=('glibc')
source=(https://www.chronox.de/jent/releases/$pkgver/$_pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('25610ea16f3e490017bf658297f27e83d2962bd7ac6bbde23dacd65914ad5822'
            'SKIP')
validpgpkeys=(3BCC43D4D2C87D1784B69EE4421EE936326AC15B
              342C4E3A39EA5F19909BE38AAE5D0DA3FD092353)

prepare() {
  cd "$_pkgname-$pkgver"

  # Disable man page compression on install
  sed -e '/\tgzip .*\/man\// d' -i Makefile
  # Let the package manager handle stripping
  sed -e 's/$(INSTALL_STRIP)/install/' -i Makefile
}

build() {
  cd "$_pkgname-$pkgver"
  LDFLAGS=-lpthread make jitterentropy
}

package() {
  cd "$_pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/include"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.bsd "$pkgdir/usr/share/licenses/$pkgname/LICENSE.bsd"
}

# vim:set ts=2 sw=2 et:
