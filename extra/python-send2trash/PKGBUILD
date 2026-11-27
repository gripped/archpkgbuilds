# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-send2trash
_pkgbase=send2trash
pkgver=2.2.0
pkgrel=1
pkgdesc="Send file to trash natively"
arch=('any')
url="https://github.com/hsoft/${_pkgbase}"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('44b4fc1faa481e0ecd2d01fb35b5f43e3c48ff13fe1d039874822abb61a77bd7')

build() {
	cd "${_pkgbase}-${pkgver}/"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgbase}-${pkgver}/"
	pytest
}

package() {
	cd "${_pkgbase}-${pkgver}/"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
