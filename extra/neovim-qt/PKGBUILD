# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn@gmail.com>
# Contributor: Iván Ruvalcaba <mario.i.ruvalcaba@gmail.com>
# Contributor: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgver=0.2.19
pkgrel=1
pkgdesc='GUI for Neovim'
arch=(x86_64)
url='https://github.com/equalsraf/neovim-qt'
license=(ISC)
depends=(hicolor-icon-theme neovim qt6-svg)
makedepends=(cmake git)
source=("git+$url#tag=v$pkgver")
b2sums=('a67493143f809bfa698595483ceb025863b3412affed0f7847e01c608577e8740df1355390c8092144165c5e329eb19762a0ecef89effb827f5594b0e8d33992')

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="$CFLAGS" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
    -D CMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_SYSTEM_MSGPACK=on \
    -D WITH_QT=Qt6 \
    -S $pkgname
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
