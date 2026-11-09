# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-admin
pkgver=2.5.0
pkgrel=1
pkgdesc="LXQt system administration tool."
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("qt6-base" "liblxqt" "polkit-qt6")
makedepends=("cmake" "qt6-tools" "lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc"
)
sha512sums=('4a30ecc185d8493bd9706cb4bf35a7dd0e4d80de97cc3c7075963405e931f0999573ea3fe830b1cefa5c0e8138b47b9b9c03d13e5df0b9293b1e520e25f9100e'
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
