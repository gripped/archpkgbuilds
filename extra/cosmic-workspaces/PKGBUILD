# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-workspaces
pkgver=1.0.0.beta.9
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
b2sums=('9d0160a9591c4b7ad866f807d0a73160d51468b66ded02ddb16164440c8bd7eb960191dba3c493586a83818dded512aec892f75b97cbe9c42f64859cc4a48411'
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
