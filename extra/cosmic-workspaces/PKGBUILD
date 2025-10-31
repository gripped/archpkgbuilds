# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-workspaces
pkgver=1.0.0.beta.4
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
_tag=9968b0e61f106fc60cc19e57cc46321c26e496dd
source=(
  git+https://github.com/pop-os/cosmic-workspaces-epoch.git#tag=${_tag}
  cosmic-workspaces-lto.patch
)
b2sums=('2f43d8eedd0cacf737e62e7e60413888dbdd11cfd0b91ce8cac7aa1fdfa5301b585d3d74166aa6d6f5cad578f8a58e31d4f4c1591938604d430b207e68a6fdc4'
        '1ea5088acc34078e58a6368976b470080aa8053a97f94a41546dd79a4c7450c419b260d1e17e7c5652bdc2b9f4b2ed547a83c69a2b37dc76ccedf94242a8fba3')

#pkgver() {
#  cd cosmic-workspaces-epoch
#  git describe --tags | sed 's/^epoch-//; s/-beta./beta/'
#}

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
