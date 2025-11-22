# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-workspaces
pkgver=1.0.0.beta.7
pkgrel=1
epoch=1
pkgdesc='Cosmic workspaces'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-workspaces-epoch
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libinput
  libxkbcommon
  mesa
  wayland
)
makedepends=(
  cargo
  git
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-workspaces-epoch.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-workspaces-lto.patch
)
b2sums=('dea1fed41d59a986342f458cf647bac500d1c7735a13e34e26650808883d0e019f52c0e49b55a8a804f144ffc7671bb8bd673eb458e1baf5e0b7ece8c8541d22'
        '1ea5088acc34078e58a6368976b470080aa8053a97f94a41546dd79a4c7450c419b260d1e17e7c5652bdc2b9f4b2ed547a83c69a2b37dc76ccedf94242a8fba3')

prepare() {
  cd cosmic-workspaces-epoch
  patch -Np1 -i ../cosmic-workspaces-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-workspaces-epoch
  RUSTFLAGS+=' -C link-arg=-fuse-ld=lld'
  make ARGS+=' --frozen --release'
}

package() {
  cd cosmic-workspaces-epoch
  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
