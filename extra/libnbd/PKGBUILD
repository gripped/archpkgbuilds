# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
pkgname=libnbd
pkgver=1.18.2
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('x86_64')
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL')
depends=('glibc' 'gnutls' 'libxml2')
makedepends=('perl' 'ocamlbuild' 'ocaml-findlib' 'rust' 'fuse3' 'python' 'go')
optdepends=(
  'fuse3: For nbdfuse support'
  'ocaml: For OCaml bindings'
  'python>=3: For Python bindings'
)
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
_dldir="${pkgver%.*}"
source=(
	"http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz"
    "http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz.sig"
)
sha256sums=('398b4d1c020683026e6a9a0934431592ead42bd6d0eca3be576db76c60b44c52'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CFLAGS+=" -ffat-lto-objects"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/src
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}
