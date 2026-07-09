# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=m17n-db
pkgver=1.8.13
pkgrel=1
pkgdesc='Multilingual text processing library (database)'
url='https://www.nongnu.org/m17n/'
arch=('any')
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later' 'MIT')
depends=('glibc') # not because of compiling, but because of /usr/share/i18n/charmaps/ files that glibc provides
source=("https://download.savannah.gnu.org/releases/m17n/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1f43ee768e79be30d293bd44a1ccaa7ea8d2ebfebd8e0b06775fdd4ce23eab2a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

# Drop script that makes UIM segfault http://savannah.nongnu.org/bugs/index.php?53202
  rm "$pkgdir"/usr/share/m17n/hu-rovas-post.mim
}
