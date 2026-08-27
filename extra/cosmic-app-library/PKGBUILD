# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-app-library
pkgver=1.7.0
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
b2sums=('40c17f80c56554ee602d2531c0f2162b9304b5568ef354ca6edfa789efd3606733f72163cafb12dc4749f02589b171c83b6ec297eecc74566c2e88b7cb727df5')

prepare() {
  cd cosmic-applibrary
  sed -i 's/^name = "generate"$/name = "xdgen-generate"/' scripts/xdgen/Cargo.lock
  cargo fetch --locked
  cargo fetch --locked --manifest-path scripts/xdgen/Cargo.toml
}

build() {
  cd cosmic-applibrary
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just xdgen
  just build-release --frozen
}

package() {
  cd cosmic-applibrary
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
