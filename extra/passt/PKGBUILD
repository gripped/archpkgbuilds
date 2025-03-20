# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_03_20.32f6212
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
sha512sums=('c8fa84eb91b3ae0832f2fe6e7a0dbaa22588c22b15548baf18271d24fcbffbcb725a4942336a4f98fc8aae5acab2f342fdf48c7ce615924c2454873de33159a3')
b2sums=('f603aae04a0022905b312b77ff6bbdce9464ca35d6b89688c3a389bf6588a2b0c157ec00c826ab49e75d479a7aaaf9b2f0adcf3eb1fd7582d88d8b2b7a7c4381')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
