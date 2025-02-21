# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi
_name=libffi
pkgver=3.4.7
pkgrel=1
pkgdesc="Portable foreign function interface library (32-bit)"
arch=(x86_64)
url=https://sourceware.org/libffi/
license=(MIT)
depends=(lib32-glibc $_name=$pkgver)
provides=(libffi.so)
source=(https://github.com/libffi/libffi/releases/download/v$pkgver/$_name-$pkgver.tar.gz)
sha256sums=('138607dee268bdecf374adf9144c00e839e38541f75f24a1fcf18b78fda48b2d')
b2sums=('0dd17b4fd358beb9842889168437443137445a5dba1f0a7e8669ae420d8efb927815c08602c1b1b141acfdfdbaa12b417863402a5c8df5f36519fd3e772d3f37')

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
