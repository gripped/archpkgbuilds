# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.4.0
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('10ef579b1b44a82e02cc491777e78616ed883a3b80ad50749e8c736317a8b6ded68aa4f2f28b7e54065167b049aee58dac96553ef0fb0b247aa43472b25d520f')
b2sums=('a41bfcd50bd50912158db8daffd1e99f5098c659206f9298cd69b74aaf479207ce5e790c3ce480c0111cacc116d5daf1f9afdb809d8b45f1dc11d2cdb174cd69')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
