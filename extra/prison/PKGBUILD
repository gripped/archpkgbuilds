# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=prison
pkgver=6.22.0
pkgrel=2
pkgdesc='A barcode API to produce QRCode barcodes and DataMatrix barcodes'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(MIT)
depends=(gcc-libs
         glibc
         libdmtx
         qrencode
         qt6-base
         qt6-multimedia
         zxing-cpp)
makedepends=(doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        zxing-cpp-3.patch)
sha256sums=('c40d692607bdadf8dbd5a56761289b1ee96973f048ca3671e760519e2ae4339a'
            'SKIP'
            'ce9df9cbf606b9d17af6bf383ac7ca4ab4cb25dee4e30c75c114a0cc28a7b566')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  patch -d $pkgname-$pkgver -p1 < zxing-cpp-3.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
