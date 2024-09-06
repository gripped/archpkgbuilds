# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Arkadiusz Laczynski <alaczynski@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=aspell-pl
pkgver=20240901
pkgrel=1
pkgdesc='Polish dictionary for aspell'
arch=('any')
url="https://www.sjp.pl/slownik/en/"
license=('GPL' 'LGPL' 'MPL' 'CC SA' 'Apache')
depends=('aspell')
source=(https://sjp.pl/sl/ort/sjp-aspell6-pl-6.0_$pkgver-0.tar.bz2)
sha256sums=('cf59cc16580191c4ad3298e8f1981367da8ef3d07cfb6ac60a166016f018f2c6')

build() {
  cd aspell6-pl-6.0_$pkgver-0

  ./configure
  make
}

package() {
  cd aspell6-pl-6.0_$pkgver-0

  make DESTDIR="$pkgdir" install
}
