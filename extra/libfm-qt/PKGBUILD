# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=libfm-qt
pkgver=2.3.0
pkgrel=2
pkgdesc="Core library of PCManFM-Qt (Qt binding for libfm)"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/libfm-qt/blob/2.0.1/README.md?plain=1#L8-L10
license=("LGPL-2.1-or-later")
depends=("menu-cache" "libexif" "qt6-base" "lxqt-menu-data")
makedepends=("lxqt-build-tools")
optdepends=(
  "org.freedesktop.secrets: allow to remember mount passwords"
)
provides=("libfm-qt6.so")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha512sums=('939c911583611a19d180647725a23df65e1fa9cdef8e6f451902576765abc2eae075a648730770a4f2e9c9d81a95f21fea8d8a8e66a725f194fd43265e58e2c1'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)
# Work-around https://gitlab.kitware.com/cmake/cmake/-/issues/17122
# Relevant CMake codes: https://github.com/lxqt/libfm-qt/blob/1.2.1/src/CMakeLists.txt#L179
options=('!emptydirs')

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
