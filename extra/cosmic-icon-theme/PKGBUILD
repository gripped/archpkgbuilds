# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-icon-theme
pkgver=1.0.11
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
b2sums=('ca8f57106afe361b8408d6abc9b36c03f7b5be1255d906c95ccf1f8858fdd7fafee4a0aefff868eab12520e1ab852282e31d7f25b40c2f1c8fd94f19c52288e8')

package() {
  cd cosmic-icons
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
