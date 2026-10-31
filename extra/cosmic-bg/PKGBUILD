# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.11.0
pkgrel=1
epoch=1
pkgdesc='COSMIC session service which applies backgrounds to displays'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-bg
license=(MPL-2.0)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
  dav1d
)
makedepends=(
  clang
  cargo
  git
  just
  lld
  nasm
)
source=(
  git+https://github.com/pop-os/cosmic-bg.git#tag=epoch-${pkgver}
)
b2sums=('87d9f5f5b2930164d96209c9d7b30ccada32d2b7dd86574acc99ef83b5440a19f64a7c6c40cf603acb6ddae109db61aa632909e50d40ac560fbc921b12a09f3c')

prepare() {
  cd cosmic-bg
  cargo fetch --locked
}

build() {
  cd cosmic-bg
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-bg
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
