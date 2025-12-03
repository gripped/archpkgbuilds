# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-randr
pkgver=1.0.0.beta.9
pkgrel=1
pkgdesc='Library and utility for displaying and configuring Wayland outputs'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-randr
license=(MPL-2.0)
groups=(cosmic)
depends=(
  gcc-libs
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
  git+https://github.com/pop-os/cosmic-randr.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-randr-lto.patch
)
b2sums=('916b297ba46292b0542c1bbdff804dd2e183f8b8e218db017eb8bab9ab60ba030e6932ed23155acb15e345406d1cb948d92880abfa8bfa769bfafbcb11aa5056'
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
