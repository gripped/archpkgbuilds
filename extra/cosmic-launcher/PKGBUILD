# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-launcher
pkgver=1.11.0
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
b2sums=('0599d650c2c30b87bcd2805e557b2c18c7aadf1d67e969c241fa92859c7e55fc432fd5b7c3c6fe492b4e8c0faaa7b4804ed6cb569676444f4e062e00fc321d78'
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
