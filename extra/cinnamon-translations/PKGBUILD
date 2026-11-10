# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.8.0
pkgrel=1
pkgdesc='Translations for Cinnamon and Nemo'
arch=(any)
url='https://github.com/linuxmint/cinnamon-translations'
license=(GPL-2.0-or-later)
makedepends=(git)
source=("git+https://github.com/linuxmint/cinnamon-translations.git#tag=$pkgver")
b2sums=('4b7dd416b9c74a3d49a799d1c4261f2adb19776255f4977dc8a7b0cf3a70e60498cd4a37a7bbcd918adf45b5c3ddcb0af761c933c7a213bbe9e98841569e6f3f')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  cp -r usr/ "$pkgdir"
}
