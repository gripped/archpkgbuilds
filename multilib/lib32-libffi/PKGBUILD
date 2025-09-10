# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.5.2
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('dd19253d3007f366319a51d248a40c9e5fcace4498cbea990b566291844e4e30')
b2sums=('4aa7ecdbb7abc862f876cc0b0484f944fe6c49633071d36a964ad94f06d02ee08c76dceed5d6897da02c357515033f084a9a4da3a22bdd559316a5dca736332d')

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
