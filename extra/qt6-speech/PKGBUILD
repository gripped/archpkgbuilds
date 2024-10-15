# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-speech
_pkgver=6.8.0
pkgver=6.8.0
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Qt Speech support'
depends=(gcc-libs
         glibc
         qt6-base
         qt6-multimedia)
makedepends=(cmake
             flite
             git
             ninja
             qt6-declarative
             speech-dispatcher)
optdepends=('flite: flite TTS backend'
            'speech-dispatcher: speech-dispatcher TTS backend'
            'qt6-declarative: QML bindings')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('044059a383057ecb2a30e00eb0efe18b08b186444fe1ec2e1cde201011eaa5e2')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
