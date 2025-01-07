# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.4.2
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4fb80a159a9d980e6c0f2a2fd38b3c9493ac447a5ea813ac530b2e78598101db01c203d66906b35c1e3ecc9f4869789140ebed7f6de048d7790bd36dd252dda7')
b2sums=('16dcc543e8becca4808c670ea08e6850a5931b69bf76e0dbc25d5101ee7228f3f2ddbb70e88cba02a291c1c5c98ce63f1d3677ca34cce0f0be0d275196810e69')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
