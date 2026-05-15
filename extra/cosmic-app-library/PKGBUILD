# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-app-library
pkgver=1.0.13
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
b2sums=('11c17fb9d4032a769d58c58881ba0f7f0c8db1f522af752d4a24dceebb802d24fd7bfb80cda0a8c12d2d2876892f7df44728545d0f9dafca045b72627944b201')

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
