# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-workspaces
pkgver=1.0.0
pkgrel=1
epoch=2
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
  git+https://github.com/pop-os/cosmic-workspaces-epoch.git#tag=epoch-${pkgver}
  cosmic-workspaces-lto.patch
)
b2sums=('cbcec16c5375e900209a3c23447af9a7cdbebe9bad5a07f53402caceaa0a765a412cd5c77bb800d12263eb155a4c3315b8fcb0b7827389f1d5321d093a421858'
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
