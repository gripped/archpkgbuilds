# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pipcl
_pkgname=${pkgname#python-}
pkgver=2
pkgrel=1
pkgdesc="Python packaging operations for use by a setup.py"
url="https://github.com/ArtifexSoftware/pipcl"
arch=('any')
license=('AGPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07294dfbfe7246297d934ef35c82e074bfb5965f1502b9fd201947f1b2b6bc41')

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
	python -m installer --destdir="$pkgdir" dist/*.whl
}
