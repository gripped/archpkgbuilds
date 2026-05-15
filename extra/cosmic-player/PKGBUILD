# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-player
pkgver=1.0.13
pkgrel=1
epoch=1
pkgdesc="WIP COSMIC media player"
arch=(x86_64)
url="https://github.com/pop-os/cosmic-player"
license=(GPL-3.0-or-later)
groups=(cosmic)
depends=(
  libgcc
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
source=(git+https://github.com/pop-os/cosmic-player.git#tag=epoch-${pkgver})
sha256sums=('3ec4b5cd95b0b78ebc93eb4d58bbab5542bbe6fe71029f8c8301cae50462e912')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"

  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}
