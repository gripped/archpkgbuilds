# Maintainer: Anatol Pomozov <anatol pomozov at gmail> 
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Konstantin Plotnikov <kostyapl at gmail dot com>

pkgname=fossil
pkgver=2.27
pkgrel=1
pkgdesc='Simple, high-reliability, distributed software configuration management'
arch=(x86_64)
url='https://www.fossil-scm.org'
license=(BSD-2-Clause)
depends=(
  fuse2
  glibc
  openssl
  sqlite
  zlib
)
makedepends=(tcl)
optdepends=('tcl: diff --tk support')
source=(
  "https://fossil-scm.org/home/tarball/version-$pkgver/fossil-src-$pkgver.tar.gz"
  "$pkgname.socket"
  "$pkgname.service"
  "$pkgname-fix-tests.patch"
)
b2sums=('b7e69329e35973532f6b14b2b19f1e8da99855f2c7f6818c5e610b533610c9ef3fa240e26e51b9290885cc3e97d0e3f36eb63675304e9644658a069a9fd902b4'
        'c08d0f6cf864b10f81af6e27cd1e43c8a6d570085b8da114adbda048d7926e403ee7d208d39a62f24ced6acf9f89b7e91a05d02dcb43a6f9f557238a699b0068'
        '9dc1b1bf1425dd2b865cb5e0114df401a66d36583aa40cad9ee8ca1875952c094b6439f4decd0748633fd064bad7c8ba469d21477a72794a17cec38ca4ca9b43'
        'f88ca1638c5b03d5d97b2fad944d08d0f43be415f93829baf52ee7d1800a49fc2b8f108b366e3dc74d0135e8ab0499b295ae7cfa9322dbfbd4eded563e9416bc')

prepare() {
  cd fossil-src-$pkgver
  patch -Np1 < ../$pkgname-fix-tests.patch
}

build() {
  cd fossil-src-$pkgver
  ./configure --prefix=/usr \
    --json \
    --with-sqlite=/usr \
    --with-tcl=/usr \
    --with-tcl-private-stubs=1
  make
}

check() {
  cd fossil-src-$pkgver
  tclsh test/tester.tcl fossil
}

package() {
  install -vDm644 $pkgname.socket "$pkgdir/usr/lib/systemd/system/$pkgname.socket"
  install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname@.service"

  cd fossil-src-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" fossil
  install -vDm644 tools/fossil-autocomplete.bash "$pkgdir/usr/share/bash-completion/completions/fossil"
  install -vDm644 tools/fossil-autocomplete.zsh "$pkgdir/usr/share/zsh/site-functions/_fossil"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT-BSD2.txt
}
