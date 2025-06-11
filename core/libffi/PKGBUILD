# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libffi
pkgver=3.5.0
pkgrel=1
pkgdesc='Portable foreign function interface library'
arch=(x86_64)
url='https://sourceware.org/libffi/'
_url="https://github.com/libffi/libffi"
license=(MIT)
depends=(glibc)
checkdepends=(dejagnu)
provides=(libffi.so)
source=($pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ddaac13cdb323cf1fc16934ddda877d51f02871977ab0a94941329c9f04dd53e')
b2sums=('1d6f4c9344f7cf3f6e7fdaf39cab8da1cfed3bb4de54d5c6b12cae606f249e93ad303c9214b87277f593501e1f19ec81b4176b34965e0b03a55db49cb94b2f3d')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv

}

build() {
  local configure_options=(
    # remove --disable-exec-static-tramp once ghc and gobject-introspection
    # work fine with it enabled (https://github.com/libffi/libffi/pull/647)
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --disable-static
    --enable-pax_emutramp
    --prefix=/usr
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
