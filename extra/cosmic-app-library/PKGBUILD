# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-app-library
pkgver=1.5.0
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
b2sums=('c00b69ca0d91d7f67becd2bd5df19337d0d0915196bff82cd4726338e759c4a0c649f378762a037c39bbac16a332a7726b759af4e99089846880ab1c39f12af0')

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
