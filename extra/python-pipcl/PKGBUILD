# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=python-pipcl
_pkgname=${pkgname#python-}
pkgver=7
pkgrel=1
pkgdesc="Python packaging operations for use by a setup.py"
url="https://github.com/ArtifexSoftware/pipcl"
arch=('any')
license=('AGPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97efa5056885bef6a0a659d2d25bc7a74222e9bb89f79e918af68213673158b4')

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
