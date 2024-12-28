# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>, simo <simo@archlinux.org>

pkgname=kexec-tools
pkgver=2.0.30
pkgrel=1
pkgdesc="Load another kernel from the currently executing Linux kernel"
arch=('x86_64')
url="https://kernel.org/pub/linux/utils/kernel/kexec/"
source=("git+https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git?signed#tag=v${pkgver}")
makedepends=('git')
validpgpkeys=('E27CD9A1F5ACC2FF4BFE7285D7CF64696A374FBE') # Simon Horman <horms@debian.org>
depends=('zlib' 'xz')
license=('GPL-2.0-or-later')
b2sums=('9092d6cb1f08018088c96bf42c734be97be072726888617b58505349c0c4945d6e1c382210bc1c176548615c7fdd169a6331a6fffc17b75ea79795669bfcb49b')

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

