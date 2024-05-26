# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-speech
pkgver=6.7.1
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
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('37f83aab9a333327189d08266daf2d70611461cdae3437a31b5fd5a4f856c1cd')

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
