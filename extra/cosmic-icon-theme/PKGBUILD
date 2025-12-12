# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-icon-theme
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Cosmic icon theme'
arch=(any)
url=https://github.com/pop-os/cosmic-icons
license=(CC-BY-SA-4.0)
depends=(pop-icon-theme)
makedepends=(
  git
  just
)
options=(!strip)
source=(git+https://github.com/pop-os/cosmic-icons.git#tag=epoch-${pkgver})
b2sums=('628c69c5ddbfa446ee0b5e8c9b4889f468049eb401e26238e70929288739c3f4f874a0e4987f7c7f75d9ca2e282621090beeed7bfb96ba5ff4279021c15ec49a')

package() {
  cd cosmic-icons
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
