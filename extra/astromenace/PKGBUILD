# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Ivan Bobrov <ibobrik at gmail dot com>
# Contributor: Black_Mage <vleon1 at gmail dot com>

pkgname=astromenace
pkgver=1.4.2
pkgrel=2
pkgdesc="Hardcore 3D space shooter with spaceship upgrade possibilities"
arch=('x86_64')
url="http://www.viewizard.com/astromenace/index_linux.php"
license=('GPL3')
depends=('sdl2' 'freealut' 'libjpeg' 'libvorbis' 'glu' 'freetype2' 'libxinerama')
makedepends=('cmake' 'mesa' 'ninja')
source=("$pkgname-$pkgver".tar.gz::https://github.com/viewizard/astromenace/archive/v${pkgver}.tar.gz
         https://github.com/viewizard/astromenace/commit/d5e007cf.patch)
sha512sums=('6a41c987295ff7201b2a9fa748b2b246c5d61bf4ae39668e614fbec377abfe08387a66182059c0e87d1c8395aa224ae396535b0f41a0be720fc57d319249e8b0'
            '391ea09ca2ace8f52cf6417d26429556c7e725456d0b86c840fd467dfb3e1cc889ceadaf2c09ad9fecee5afa2686a2271ca0480f0893b043ff8f067e97584e6d')

prepare() {
# Fix build with GCC 13
  patch -d $pkgname-$pkgver -p1 < d5e007cf.patch
}

build() {
  cd astromenace-$pkgver

  cmake \
      -GNinja \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DDATADIR=/usr/share/astromenace
  ninja -C build
}

package() {
  cd astromenace-$pkgver

  install -Dm755 build/astromenace "$pkgdir"/usr/bin/astromenace
  install -Dm644 build/gamedata.vfs "$pkgdir"/usr/share/astromenace/gamedata.vfs
  install -Dm644 share/astromenace_128.png "$pkgdir"/usr/share/pixmaps/astromenace.png
  install -Dm644 share/astromenace.desktop "$pkgdir"/usr/share/applications/astromenace.desktop
  install -Dm644 share/astromenace.appdata.xml "$pkgdir"/usr/share/metainfo/astromenace.appdata.xml
}
