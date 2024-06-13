# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.2.0
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('f098fd671f0a59d3cf80ef4b59c1d8b622eaa147e7ad8d37ee017d9b6748bdac89fd4bb1dbf2ed6799b566b5d1d4d4b8201bd956ea5248cf4f697c8734ab813c')
b2sums=('87dc6892ab318b64e12d32b936b10fee89f727838546f1666fbc61d6b80694c0924d37d7189386c7b58727165966fa9856040136a4ea49d98387d173bad07ff7')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
