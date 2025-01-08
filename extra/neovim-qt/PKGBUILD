# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn@gmail.com>
# Contributor: Iván Ruvalcaba <mario.i.ruvalcaba@gmail.com>
# Contributor: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgver=0.2.18
pkgrel=6
pkgdesc='GUI for Neovim'
arch=(x86_64)
url='https://github.com/equalsraf/neovim-qt'
license=(ISC)
depends=(hicolor-icon-theme neovim qt6-svg)
makedepends=(cmake git)
source=("git+$url#tag=v$pkgver")
b2sums=('08aba78fd332819d771fd4ddc2303f97db63affec400595a27fed91cd8408d743953bfefafc22aa3c873eabfac4565a57c719c95c9c5b11df1acca8b83740dbf')

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
