# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=pavucontrol-qt
pkgver=2.5.1
pkgrel=1
pkgdesc="A Pulseaudio mixer in Qt (port of pavucontrol)"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# LICENSE contains GPLv2; the src/*.cc and src/*.h license headers explicitly
# allow version 2 or any later version, hence GPL-2.0-or-later.
# https://github.com/lxqt/pavucontrol-qt/blob/2.5.1/src/pavucontrol.cc#L7-L10
license=("GPL-2.0-or-later")
depends=("pulse-native-provider" "qt6-base")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha256sums=('a4c3839571f3d1bb556fe10c8f53316d6cc6374a98af49b1506a6aca2c5b7316'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
	"48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
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
