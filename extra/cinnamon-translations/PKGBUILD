# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.6.1
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
makedepends=(git)
source=(git+${url}#tag=$pkgver)
sha512sums=('4d1ca463c05cb1d3ef9f687b734701a308fbce0ffc3237ea541398a6cc5ff1d2974c5631ba31d6fc5e73f826ee32a5d359dcf67d13bbfb84190aae6f1233a0a3')
b2sums=('694214e4d373c9ab18079a4b892346b665c1ee4b97aa8a4a8a6ff22bf0bb238e0f68adb2d7a21f19f5e5a945e5d9da296a7d4f8aa0e6fb00298d3f1394f634d9')

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr/ "${pkgdir}"
}
