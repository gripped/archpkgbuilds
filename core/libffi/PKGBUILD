# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libffi
pkgver=3.6.0
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
sha256sums=('5ad876a153a6ad0d706fcb5a53af1e43efe3be88668f78d833b49353bd51a939')
b2sums=('f76b0caa8972feade8da43a1a2e057785f02d034ae3fdf646b564c0d084b9a6a36909eda5b525ba7d45be0686cdb51d1c984a3a514425c8cfadd300d45794105')

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
