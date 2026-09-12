# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-icon-theme
pkgver=1.8.0
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
b2sums=('813e30091b5ba12fc507670dace5fe6f61fb084ff9274dbfd268157ea2ffa2bbbc42edc6dbb8cf9f422c497fa1b27838eadc14188fa6a6c14da569b68cfa5bdd')

package() {
  cd cosmic-icons
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
