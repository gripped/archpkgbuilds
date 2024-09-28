# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-speech
pkgver=6.7.3
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
sha256sums=('109dd7794f0d5b1803a3ee8fdefc9939f5066868b69bfd80225cc901348c4038')

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
