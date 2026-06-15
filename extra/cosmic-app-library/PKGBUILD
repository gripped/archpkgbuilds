# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-app-library
pkgver=1.0.16
pkgrel=1
epoch=1
pkgdesc='Cosmic App Library'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-applibrary
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(git+https://github.com/pop-os/cosmic-applibrary.git#tag=epoch-${pkgver})
b2sums=('b81c782fae4728a4abea5cefd8e1ab07b92dde7ba21015b0511dd0be15a648ab55461b654a587b6bf506167a6462b5948133cf4706567f5a7426a06510a33d46')

prepare() {
  cd cosmic-applibrary
  cargo fetch --locked
}

build() {
  cd cosmic-applibrary
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-applibrary
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
