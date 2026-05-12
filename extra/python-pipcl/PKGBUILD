# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pipcl
_pkgname=${pkgname#python-}
pkgver=4
pkgrel=1
pkgdesc="Python packaging operations for use by a setup.py"
url="https://github.com/ArtifexSoftware/pipcl"
arch=('any')
license=('AGPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a7a53197323cb1e65f75405ca7a93cf988beb839ba483f7fa8b7d28f21440fc')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	PATH="${PWD}/test-env/bin:${PATH}" test-env/bin/python -m pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
