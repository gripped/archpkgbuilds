# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_07_26.57a21d2
pkgrel=1
pkgdesc="Plug A Simple Socket Transport"
arch=(x86_64)
url="https://passt.top/passt/about/"
license=(
  BSD-3-Clause
  GPL-2.0-or-later
)
depends=(glibc)
optdepends=(
  'sh: for demo script'
)
source=(https://passt.top/$pkgname/snapshot/$pkgname-$pkgver.tar.zst)
sha512sums=('0c2eefcb216e6d3fa0f0c67d5c03a649af98c6485b55aa0619ca51f1cd9d44be2b86771bf19c04c766e3ea6a658ecc676a93f70e77e1f11ab0fd99e329f2486a')
b2sums=('4f05ece12c48e92ebf6b4727a9c2066664ec68085a61e52bd1be8b585e76e3927117362672b74c507a139a8f810ab9ea5b0689e480a80e92c93f3f42c8f3f926')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
