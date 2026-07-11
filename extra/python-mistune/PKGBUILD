# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune
_pkgname=mistune
pkgver=3.3.3
pkgrel=1
epoch=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
url="https://mistune.lepture.com"
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/lepture/mistune/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e3ef17e876f72e29be515357014644fb36a46b8f5cf0a60d130947262ab8f65452212601252bc2c002bec6123913e4ba24311640c447136207078f9b54cb9d1')
b2sums=('237ad5204eb2a71e104fa99be0017c6db9a44f40d4ac16da901010cc937fd633267dba69b8541226de2d8b58a97ee894f808584a44ae751e2755dbb309bc17ad')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
