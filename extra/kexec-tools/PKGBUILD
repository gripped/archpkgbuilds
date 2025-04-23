# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>, simo <simo@archlinux.org>

pkgname=kexec-tools
pkgver=2.0.31
pkgrel=1
pkgdesc="Load another kernel from the currently executing Linux kernel"
arch=('x86_64')
url="https://kernel.org/pub/linux/utils/kernel/kexec/"
source=("git+https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git?signed#tag=v${pkgver}")
makedepends=('git')
validpgpkeys=('E27CD9A1F5ACC2FF4BFE7285D7CF64696A374FBE') # Simon Horman <horms@debian.org>
depends=(
  xz
  zlib
  zstd
)
license=('GPL-2.0-or-later')
b2sums=('5ea9c0582cf05e3930c7d391c67ded18c18b1bea8bdd511b455479ddc95808777b3a121289849d7fd187b2799eeaae92f4c2623cfb7cfd475b821ce512b887f8')

prepare() {
  cd "${pkgname}"
  ./bootstrap
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sbindir=/usr/bin --without-lzma
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 kexec/kexec.8 "$pkgdir"/usr/share/man/man8/kexec.8
}

