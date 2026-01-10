# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Piotr Dąbrowski <piotr_dab at op dot pl>
# Contributor: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=python-onigurumacffi
_pkgname=${pkgname#python-}
pkgver=1.4.1
pkgrel=3
pkgdesc="Python cffi bindings for the oniguruma regex engine"
url="https://github.com/asottile/onigurumacffi"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'oniguruma' 'python' 'python-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8a642fe93a3c3fd2ad28baf506d3364bcae04e9cb93aa63c08ac4a4180007b0c')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
