# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-notificationd
pkgver=2.3.0
pkgrel=1
pkgdesc="LXQt notification daemon and library."
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lxqt-notificationd/blob/2.0.1/AUTHORS#L9
license=("LGPL-2.1-or-later")
depends=("qt6-base" "liblxqt" "kwindowsystem" "libQt6Xdg.so" "layer-shell-qt")
makedepends=("cmake" "lxqt-build-tools")
provides=("notification-daemon")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha512sums=('bda9f9dbbc5ce13a12d411554fe8f084358d5ae6879949da90c3e5b8029b59af2aefe0adf262c977dcd2dd0e1e2e6862e4754db0f9d301f208b1cc7e49560d98'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
