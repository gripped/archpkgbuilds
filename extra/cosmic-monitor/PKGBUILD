# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: LiamillionSS <liamillion-dev at protonmail dot com>
pkgname=cosmic-monitor
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc="COSMIC System Monitor"
arch=(x86_64)
url="https://github.com/pop-os/cosmic-monitor"
license=('GPL-3.0-only')
groups=(cosmic)
depends=(
  libxkbcommon
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
source=(git+https://github.com/pop-os/cosmic-monitor.git#tag=epoch-${pkgver})
sha256sums=('55fdfd913fc5f20c84e91c88bf75bc1bac820d3859f5d16e6a46cb57303393e8')

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname}"
  just rootdir="$pkgdir" install
}
