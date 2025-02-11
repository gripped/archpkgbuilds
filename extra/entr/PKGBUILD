# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=entr
pkgver=5.7
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
url="http://eradman.com/entrproject"
arch=('x86_64')
license=('MIT')
depends=('glibc')
checkdepends=('procps-ng' 'git' 'vim' 'tmux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eradman/entr/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a267fdc3a9aeb84823e14167a7aed32d682d200e72409f896e95aea3cb22e5185e1ee1c49726435d66953baae6444d49111e0c6a0af66895bdef0fccd3320446')

build() {
	cd "${pkgname}-${pkgver}"
	export PREFIX='/usr'
	./configure
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	TERM='xterm' make test
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
