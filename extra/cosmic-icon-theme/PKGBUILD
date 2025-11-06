# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-icon-theme
pkgver=1.0.0.beta.5
pkgrel=1
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
source=(git+https://github.com/pop-os/cosmic-icons.git#tag=epoch-${pkgver/.beta./-beta.})
b2sums=('b747398386fabf0fe7a11008a157503a7127555a73342902eee280530ce0b80f99fbd2c6cb9f0af9267104d42f31fe03400adb9f7954b3eca75c673765b404a6')

package() {
  cd cosmic-icons
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
