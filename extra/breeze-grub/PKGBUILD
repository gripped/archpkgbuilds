# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-grub
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Breeze theme for GRUB'
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(grub)
makedepends=()
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('6191f88b3056c5a4ce25e58c69c292c1bf162a0c221d3e845b378fd9f78d0c23'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

package() {
  install -d "$pkgdir"/usr/share/grub/themes
  cp -r $pkgname-$pkgver/breeze "$pkgdir"/usr/share/grub/themes
}
