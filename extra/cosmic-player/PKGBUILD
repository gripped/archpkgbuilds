# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-player
pkgver=1.9.0
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
sha256sums=('bd442dc091089b537fa9bb02577099f0852d7402cfa2566f54559c08d4ad9eee')

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
