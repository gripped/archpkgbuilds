# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-randr
pkgver=1.11.0
pkgrel=1
epoch=1
pkgdesc='Library and utility for displaying and configuring Wayland outputs'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-randr
license=(MPL-2.0)
groups=(cosmic)
depends=(
  libgcc
  glibc
  wayland
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-randr.git#tag=epoch-${pkgver}
  cosmic-randr-lto.patch
)
b2sums=('4446d00dc6bcabc02a380a79e5a9362a422431921f497d8e1f25a03fd5b8d10c0852d58b070010031d9310ea9c60c7d496c11c28a03b77b45a735f84b3c702c0'
        '3bcdff90827243e43c4c581a8982a2739c339a98de089739c0ceaea2fdd76e555bde0a81a52f3603ee3cf7ccf8cf9e1410fd7211e445252fda7ce909ce13d776')

prepare() {
  cd cosmic-randr
  patch -Np1 -i ../cosmic-randr-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-randr
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-randr
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
