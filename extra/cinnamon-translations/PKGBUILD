# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.6.0
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
makedepends=(git)
source=(git+${url}#tag=$pkgver)
sha512sums=('0493094b145f7a0d09a529eac6c6b01d7ca15fd2926dde1f1c4dbc4eed1052b0b9cf88061f911621142943050750c051c19700b906a27c4657de2eb750b7c4d9')
b2sums=('9ca1614ce6047a199d4e5f8168864ca09404034fd3b6fce6a02ae1be439f5f7ddeb7c84f44923b21f70f26ecb2030a82933f29d0176bad2ba2bd1316ab47d759')

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr/ "${pkgdir}"
}
