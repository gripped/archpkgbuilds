# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=python-sqlparse
pkgver=0.5.5
pkgrel=1
pkgdesc="Non-validating SQL parser for Python"
arch=('any')
url="https://github.com/andialbrecht/sqlparse"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5b254389b2fb82dd834ed1899c1f389e2d7f5626ba8e90878769f69b41f43413')

build() {
	cd "sqlparse-${pkgver}/"
	python -m build --wheel --no-isolation
}

check() {
	cd "sqlparse-${pkgver}/"
	pytest
}

package() {
	cd "sqlparse-${pkgver}/"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
