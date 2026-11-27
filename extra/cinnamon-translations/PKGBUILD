# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.8.1
pkgrel=1
pkgdesc='Translations for Cinnamon and Nemo'
arch=(any)
url='https://github.com/linuxmint/cinnamon-translations'
license=(GPL-2.0-or-later)
makedepends=(git)
source=("git+https://github.com/linuxmint/cinnamon-translations.git#tag=$pkgver")
b2sums=(884ddc9da0a9b3d53a06ce58819251d38622259cd3fdebc31ac447f1f0899f383902cefb7f61512534b31e7c5e3559edc00584528a5d0eba3df36137baf90ca9)

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  cp -r usr/ "$pkgdir"
}
