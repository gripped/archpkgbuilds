# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-launcher
pkgver=1.0.16
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
b2sums=('4d6e572c47cba66e2e646aa7f93ba4d00877fa0f75b129ff95b31e6bc152d964f443280e5fdafacd0b25d7a2c332b85bc6f905eac84848be68d644294db45565'
        'a83c9394a6975f848e6786b3760f762351dd95f6fcd6dcb51c1beb5fae65f46f4d1e218fae00b854e592639bbe7c086e7d9a78ae2e6b0a26702e33c9140553c5')

prepare() {
  cd cosmic-launcher
  patch -Np1 -i ../cosmic-launcher-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-launcher
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-launcher
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
