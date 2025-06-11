# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.5.0
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ddaac13cdb323cf1fc16934ddda877d51f02871977ab0a94941329c9f04dd53e')
b2sums=('1d6f4c9344f7cf3f6e7fdaf39cab8da1cfed3bb4de54d5c6b12cae606f249e93ad303c9214b87277f593501e1f19ec81b4176b34965e0b03a55db49cb94b2f3d')

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
