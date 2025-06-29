# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.5.1
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ca180dccd8e26900a169efd6e09207eaa0a9be268010b8faec10476c9c4951d9')
b2sums=('76864af6b1567aae025c28aad358e377117ed15f7dd123998a8dfd4330b37b5874ac70ff3789621590638b7d9b9366554ad656f08d3bac371f2c6dbe1fc336d6')

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv

}

build() {
  local prepare_options=(
    --build=i686-pc-linux-gnu
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --disable-static
    --enable-pax_emutramp
    --libdir=/usr/lib32
    --prefix=/usr
  )

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name-$pkgver
  ./configure "${prepare_options[@]}"
  make
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
