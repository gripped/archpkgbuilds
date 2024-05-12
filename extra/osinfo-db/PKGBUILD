# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=osinfo-db
pkgver=20240510
pkgrel=1
pkgdesc='Osinfo database of information about operating systems for virtualization provisioning tools'
arch=('any')
url='https://libosinfo.org/'
license=('GPL-2.0-or-later')
makedepends=('osinfo-db-tools')
source=("https://releases.pagure.org/libosinfo/$pkgname-$pkgver.tar.xz"{,.asc})
noextract=("$pkgname-$pkgver.tar.xz")
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF'  # Daniel P. Berrange
              '09B9C8FF223EF113AFA06A39EE926C2BDACC177B'  # Fabiano Fidêncio
              '206D3B352F566F3B0E6572E997D9123DE37A484F') # Victor Toso de Carvalho <me@victortoso.com>
sha256sums=('08a2d521c485687f6be39940d5b3f61bc0f583bb7e3655a131c658385eb7e5ca'
            'SKIP')

package() {
  osinfo-db-import --root "$pkgdir" --system $pkgname-$pkgver.tar.xz
}
