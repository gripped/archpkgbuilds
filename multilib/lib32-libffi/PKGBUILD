# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.7.1
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('df80a3ff1d3421ac2ae0e368575f82f30383f932481ecf2dd1d5f7f88c92f547')
b2sums=('c7527bf092321198065151f12f8651b0ae1266dbea5d3cced9dc164c5e89a1d1d6e4d34649ab6feb574a7756f7628f495a3832b1a4913c12095c95c913443952')

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
