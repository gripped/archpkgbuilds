# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune
_pkgname=mistune
pkgver=3.3.2
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
sha512sums=('1e8842dfac989dd3e477f6e3c4ae27ad43b2b5bfb269b32a6252973616061d6f4f75a5bb15073dac073d112b360479488562c7ca25428300ae26cf9689475b97')
b2sums=('838529811137067a1df64d81e03ab10620b658b051c3202e7b4d39b573296ee1e3ea649db49ff544bff78f144b774c83485210a35ebf0eee8140949bd0fcfece')

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
