# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: LiamillionSS <liamillion-dev at protonmail dot com>
pkgname=cosmic-monitor
pkgver=1.6.0
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
sha256sums=('7ee13a902d4b407cfe347389c4f7656ecb4a7f180a54ac7c31138f6f15ff05ea')

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
