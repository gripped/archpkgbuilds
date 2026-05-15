# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-workspaces
pkgver=1.0.13
pkgrel=1
epoch=2
pkgdesc='Cosmic workspaces'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-workspaces-epoch
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
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
b2sums=('31da77b01d55b4fcd5fc9eaf0d50071c171051ba19a66fb944bf5ed50a79e5be666ca1122e31e377424f71b66fc36e450d8eee0d2a9d4d84c20c69c56908a5d5'
        '05d93d371d529e1fb6ce7a35bac8fe409fe53ca0c9413fc4d47a46f8897792be9b7ed5178bce51d557210358f9cc1a0b08c1d4b29dc57928c30eb454733684f2')

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
