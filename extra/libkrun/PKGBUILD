# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.19.8
pkgrel=1
pkgdesc="A dynamic library providing Virtualization-based process isolation capabilities"
url='https://github.com/containers/libkrun'
arch=('x86_64')
license=('Apache-2.0')
makedepends=('cargo' 'patchelf' 'clang')
depends=('glibc' 'libgcc' 'zstd' 'bzip2' 'libkrunfw' 'libpipewire' 'virglrenderer')
source=("https://github.com/containers/libkrun/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8896c71117462f868f41d26efd157c3270091814eaab3af27ca70c6857a85eb2')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  export ZSTD_SYS_USE_PKG_CONFIG=1
  make BLK=1 NET=1 EFI=0 GPU=1 SND=1 INPUT=1 VERBOSE=1
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR_Linux=lib install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
