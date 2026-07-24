# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-launcher
pkgver=1.4.0
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
b2sums=('d5fddbabfd205a64826198a460f1e5f395ef678908af9212257927b7e170e8d27e94a2a3bfa0f2808e1de68516c6ddb6165b5668720732f75eeb6aa8217c66fa'
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
