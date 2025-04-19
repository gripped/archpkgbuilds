# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgname=vokoscreenNG
pkgver=4.5.0
pkgrel=1
pkgdesc='Easy to use screencast creator'
arch=('x86_64')
url='https://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')
depends=('gst-plugins-good' 'qt6-multimedia')
optdepends=('gst-plugins-bad: record audio into AAC format'
            'gst-plugins-ugly: record screen into H.264 format')
makedepends=('git' 'qt6-tools')
source=("git+https://github.com/vkohaupt/$_pkgname.git#tag=${pkgver}"
        '0001-Add-better-integration-for-Linux.patch')
sha256sums=('8e487489fa4c30e9b163fbbd40b19e3b39cc115a5d57a2655b279cb0d668ae82'
            '422d0cd05d2fe1a1973f8eb50e95c7e4898ce3afeae97b7e67ab384f3958ffa2')

prepare() {
  cd $_pkgname
  patch -Np1 -F3 -i ../0001-Add-better-integration-for-Linux.patch
}

build() {
  cd $_pkgname
  qmake6 PREFIX=/usr src/vokoscreenNG.pro
  make
}

package() {
  cd $_pkgname
  make INSTALL_ROOT="$pkgdir" install
}
