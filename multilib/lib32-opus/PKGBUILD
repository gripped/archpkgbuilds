# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: farwayer <farwayer [at] gmail [dot] com>

pkgbase=lib32-opus
pkgname=(
  lib32-opus
)
pkgver=1.5.1
pkgrel=1
pkgdesc="Totally open, royalty-free, highly versatile audio codec (32-bit)"
url="https://www.opus-codec.org/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  lib32-glibc
  opus
)
makedepends=(
  meson
)
source=("https://downloads.xiph.org/releases/opus/opus-$pkgver.tar.gz")
b2sums=('5ba1d6f28594f366b545507bafb22751e15a0e78e152e7cdef456dccb0bc9fc512faa18c90fb4ea5455a9535de89df987dea8a0fabce9a25c285d0c410d4b482')

# https://downloads.xiph.org/releases/opus/SHA256SUMS.txt
sha256sums=('b84610959b8d417b611aa12a22565e0a3732097c6389d19098d844543e340f85')

prepare() {
  ln -s opus-$pkgver opus
  cd opus
}

build() {
  local meson_options=(
    --cross-file lib32
    -D asm=disabled
    -D custom-modes=true
    -D docs=disabled
    -D enable-deep-plc=true
    -D enable-dred=true
    -D enable-osce=true
  )

  arch-meson opus build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_lib32-opus() {
  provides=(libopus.so)

  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/usr/include"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 opus/COPYING
}

# vim:set sw=2 sts=-1 et:
