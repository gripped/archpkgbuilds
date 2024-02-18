# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libffi
pkgver=3.4.5
pkgrel=1
pkgdesc='Portable foreign function interface library'
arch=('x86_64')
url='https://sourceware.org/libffi/'
license=('MIT')
depends=('glibc')
checkdepends=('dejagnu')
provides=('libffi.so')
source=(https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz)
sha256sums=('96fff4e589e3b239d888d9aa44b3ff30693c2ba1617f953925a70ddebcc102b2')
b2sums=('6da78473741ef3861c548e0f99b98f0b05381a02eb3016875881c8fcc3a7e518c2589a541180b2defcf9f2efda23b07a6196e1efeaedfaa4f2dfff25a1e9905b')

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
