# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=pysolfc-cardsets
pkgver=3.0
pkgrel=2
pkgdesc="A collection of cardsets adapted for use with PySolFC"
arch=('any')
url="http://pysolfc.sourceforge.net/"
license=('GPL-3.0-or-later')
source=("https://downloads.sourceforge.net/pysolfc/PySolFC-Cardsets-$pkgver.tar.bz2")
sha256sums=('279d1dc44068c7ae7bb47950c19992484edcaea6b61130227de9996cb08e3b0c')

package() {
  cd PySolFC-Cardsets-$pkgver
  install -vdm755 "$pkgdir/usr/share/PySolFC"
  cp -va -t "$pkgdir/usr/share/PySolFC/" ./*
}
