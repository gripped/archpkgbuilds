# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.4.1
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('2cb6d6d1644e1d40cc1070dc8ae5f474568f083dc5df21782c9ebe60f1a35a7e302d5a785f6b75e801a35da99ad1f851926ece2a0ce0c769e8abc3b35158ff7f')
b2sums=('db2692b1d1c6f4991a4ee562e02bf33511c77e2fd61e1d73de5ee4924ccc0c18dae1e25144898b209edeba1c87d279ef41d90e8230d1f95aac6287fb2c773c58')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
