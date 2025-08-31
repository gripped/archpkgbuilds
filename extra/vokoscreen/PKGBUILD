# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgname=vokoscreenNG
pkgver=4.6.1
pkgrel=1
pkgdesc='Easy to use screencast creator'
arch=('x86_64')
url='https://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'qt6-multimedia')
makedepends=('git' 'qt6-tools')
source=("git+https://github.com/vkohaupt/$_pkgname.git#tag=$pkgver"
        'vokoscreenNG.appdata.xml')
sha256sums=('2901f5db4f874746ff284eb74d274d632fa48cdaf3c3a4eb7fa0428e17a2295c'
            'b40fdfaf0166e1735be00a08bc55091176df758af7aff6585be4122423c73dda')

build() {
  cd $_pkgname
  qmake6 PREFIX=/usr src/vokoscreenNG.pro
  make
}

package() {
  cd $_pkgname
  install -Dm755 vokoscreenNG "$pkgdir/usr/bin/vokoscreenNG"
  install -Dm644 src/applications/vokoscreenNG.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vokoscreenNG.png"
  install -Dm644 src/applications/vokoscreenNG.desktop "$pkgdir/usr/share/applications/vokoscreenNG.desktop"
  install -Dm644 ../vokoscreenNG.appdata.xml "$pkgdir/usr/share/metainfo/vokoscreenNG.appdata.xml"
}
