# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-launcher
pkgver=1.7.0
pkgrel=1
epoch=1
pkgdesc='Layer Shell frontend for Pop Launcher'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-launcher
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
  pop-launcher
  wayland
)
makedepends=(
  cargo
  clang
  git
  intltool
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-launcher.git#tag=epoch-${pkgver}
  cosmic-launcher-lto.patch
)
b2sums=('2a283f79313e34f0b6044bfe58098a5c2cca6e9ffc1c4a2b745c512ba98a0166c0d3501bdc995f7d391617951b90a0b50b43defd55c4d6c817eeabeca4e326aa'
        'a83c9394a6975f848e6786b3760f762351dd95f6fcd6dcb51c1beb5fae65f46f4d1e218fae00b854e592639bbe7c086e7d9a78ae2e6b0a26702e33c9140553c5')

prepare() {
  cd cosmic-launcher
  patch -Np1 -i ../cosmic-launcher-lto.patch
  cargo fetch --locked
  cargo fetch --locked --manifest-path scripts/xdgen/Cargo.toml
}

build() {
  cd cosmic-launcher
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just xdgen
  just build-release --frozen
}

package() {
  cd cosmic-launcher
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
