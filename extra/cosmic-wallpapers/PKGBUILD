# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-wallpapers
pkgver=1.7.0
pkgrel=1
epoch=2
pkgdesc='Wallpapers for the COSMIC Desktop Environment'
arch=(any)
url=https://github.com/pop-os/cosmic-wallpapers
license=(LicenseRef-unknown)
groups=(cosmic)
makedepends=(
  git
  git-lfs
)
source=(git+https://github.com/pop-os/cosmic-wallpapers.git#tag=epoch-${pkgver})
b2sums=('691d1487027c9c8c0859927871d63e42698c8543a0e32c760dcc8ef489307362e6091f7296f0f89f8b2e1f623251bafacc6e29ab7837fbd3199875278c7b69f9')

prepare() {
  cd cosmic-wallpapers
  git lfs install --local
  git remote add network-origin ${url}
  git lfs fetch network-origin
  git lfs checkout
}

package() {
  cd cosmic-wallpapers
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
