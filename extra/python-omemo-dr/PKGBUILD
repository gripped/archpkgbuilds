# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname='python-omemo-dr'
_pkgname="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc="OMEMO Crypto Library"
arch=('x86_64')
url="https://dev.gajim.org/gajim/omemo-dr"
license=('GPL3')
depends=('python-cryptography' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('007ea394c801c48119164b8c383d0689afb47554d9605c63ceadd2f70de1bca5')

build() {
	cd "${_pkgname}-v${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-v${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
