# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-player
pkgver=1.0.0.beta.6
pkgrel=1
pkgdesc="WIP COSMIC media player"
arch=(x86_64)
url="https://github.com/pop-os/cosmic-player"
license=(GPL-3.0-or-later)
groups=(cosmic)
depends=(
  gcc-libs
  glib2
  glibc
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gstreamer
  libxkbcommon
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(git+https://github.com/pop-os/cosmic-player.git#tag=epoch-${pkgver/.beta./-beta.})
sha256sums=('72fe2d9c63ba1c94fe02b8b76d20f4a9197ee385f485c3155913d62e244ed7f5')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable

  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}
