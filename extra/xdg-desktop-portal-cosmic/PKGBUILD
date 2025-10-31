# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.0.0.beta.4
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/xdg-desktop-portal-cosmic
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libpipewire
  libxkbcommon
  mesa
  wayland
  xdg-desktop-portal
)
makedepends=(
  cargo
  clang
  git
  mold
)
provides=(xdg-desktop-portal-impl)
_tag=463d1a79dabd4ba36675b7136dc89b18f8ab3444
source=(
  git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git#tag=${_tag}
)
b2sums=('8232f622cc4f538cc8cb5de7558583a5d35c90338ac34248ce733de84ef1c9c4330a63cd3dea72c5d8841e8ebb05f4c88b77ae9f4b51d40bb408408097e3f5bc')

prepare() {
  cd xdg-desktop-portal-cosmic
  cargo fetch --locked
}

pkgver() {
  cd xdg-desktop-portal-cosmic
  git describe --tags | sed 's/^epoch-//; s/-/./g'
}

build() {
  cd xdg-desktop-portal-cosmic
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  make ARGS+=" --frozen --release"
}

package() {
  cd xdg-desktop-portal-cosmic
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
