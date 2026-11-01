# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=pop-launcher
pkgver=1.11.0
pkgrel=1
pkgdesc='Modular IPC-based desktop launcher service'
arch=(x86_64)
url=https://github.com/pop-os/launcher
license=(MPL-2.0)
depends=(
  dbus
  fd
  glibc
  libegl
  libgcc
  libqalculate
  libxkbcommon
  pop-icon-theme
  sh
  xdg-utils
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(git+https://github.com/pop-os/launcher.git#tag=epoch-${pkgver})
b2sums=('fb7ae5846c36499e9c06f4fa9c064c7b4fb8a4105e9d213499755d3b6607cab4a39bc0d90e5ce999f5b57c1a5f817d1ef26883eefcdcdb85451686ca32cf3eb5')

prepare() {
  cd launcher
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/g' -i Cargo.toml
}

build() {
  cd launcher
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  CC=clang just build-release --frozen
}

check() {
  cd launcher
  just check
}

package() {
  cd launcher
  just rootdir="${pkgdir}" install
}
