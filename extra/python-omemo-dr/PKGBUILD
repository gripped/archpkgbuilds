# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname='python-omemo-dr'
_pkgname="${pkgname#python-}"
pkgver=1.2.0
pkgrel=2
pkgdesc="OMEMO Crypto Library"
arch=('x86_64')
url="https://dev.gajim.org/gajim/omemo-dr"
license=('GPL3')
depends=('python-cryptography' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('07c13eec1e35c29bf3cd7d2db632da5292e3eeb6d4f3a9b377d708b03dd5e2e4')

build() {
	cd "${_pkgname}-v${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-v${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
