# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Piotr Miller <nwg.piotr@gmail.com>

pkgname=autotiling
pkgver=1.9.3
pkgrel=4
pkgdesc="Script for sway and i3 to automatically switch the horizontal / vertical window split orientation"
url="https://github.com/nwg-piotr/autotiling"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-i3ipc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3270a28de977f375c80984ef50f7433cb03cfdf198b079ae9c80d1513f0e9176')

build() {
        cd "${pkgname}-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
