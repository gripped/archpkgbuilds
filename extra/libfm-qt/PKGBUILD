# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=libfm-qt
pkgver=2.5.0
pkgrel=1
pkgdesc="Core library of PCManFM-Qt (Qt binding for libfm)"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/libfm-qt/blob/2.0.1/README.md?plain=1#L8-L10
license=("LGPL-2.1-or-later")
depends=("libexif" "qt6-base" "lxqt-menu-data")
makedepends=("lxqt-build-tools")
optdepends=(
  "org.freedesktop.secrets: allow to remember mount passwords"
)
provides=("libfm-qt6.so")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha512sums=('c91608d25c02b2c3de4d56c45cec1cf58414202bf97b82622a9e53ab983b500c9d102275c190c5d030c95a22ff0f5538275827f861a4a52b9aadcf4b588aafc5'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
	"48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
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
