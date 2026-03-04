# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=entr
pkgver=5.8
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
url="http://eradman.com/entrproject"
arch=('x86_64')
license=('MIT')
depends=('glibc')
checkdepends=('procps-ng' 'git' 'vim' 'tmux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eradman/entr/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ceae34406930cffc931d139857cde17757fe1fc5727d9b0d278d9615f93cb007c238378ed4f852db40a62e1031e5c8f7f6569de75a50f11b518c1eefdccafbe8')

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
