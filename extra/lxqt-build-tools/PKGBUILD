# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=lxqt-build-tools
pkgver=2.5.0
pkgrel=1
pkgdesc="Various packaging tools and scripts for LXQt applications"
arch=("any")
url="https://github.com/lxqt/$pkgname"
license=("BSD-3-Clause")
depends=("cmake" "qt6-tools" "git" "perl")
source=("git+$url.git#tag=$pkgver?signed")
sha256sums=('8090b57b8f37776c19bdc28a7f6f91ca75bd687ffeb3d0d105c5ff36e14c0006')
validpgpkeys=(
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # https://github.com/tsujan.gpg
	"48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
	install -Dm644 ../$pkgname/BSD-3-Clause -t "$pkgdir/usr/share/licenses/$pkgname"
}
