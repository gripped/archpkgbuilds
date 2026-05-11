# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune
_pkgname=mistune
pkgver=3.2.1
pkgrel=1
epoch=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
url="https://mistune.lepture.com"
arch=('any')
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/lepture/mistune/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4f94aeeaa11c0d63418480d227bfbe4191fe9ca7346721c4dbc5ed2df6d39d76c54c72aa5ec93b7117df85d1c8d4bf4aac4d761ee259d6eab1b8f93d7905ab23')
b2sums=('c98577a5b7bdcfd4ffde6a1fddb56459679aec22f06172ec0c1dfddfe6fb158bec484e52bd299201281be76bc9ea7f9f52843839059e66b04d715d50b092fec9')

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
