# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-wallpapers
pkgver=1.0.0
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
b2sums=('583d69db75a92d7626f3c33c66940f43951e093f22b0429ebf2e21c850219c20f136b98e8b0890b5d48ac36fc14b425508e0f7fd4b59f4305d728d688525e937')

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
